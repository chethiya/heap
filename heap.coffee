MIN_LEN = 1<<5

class Heap
 constructor: (@compare) ->
  @compare ?= (a, b) ->
   if a < b
    return -1
   else if a > b
    return 1
   else
    return 0
  @array = [null]
  @len = 0

 top: -> @array[1]

 pop: ->
  res = @array[1]
  if @len is 0
   return res

  @array[1] = @array[@len]
  @array[@len] = null
  @len--

  if @len > 0

   # Remove elements
   if @array.length > MIN_LEN and @array.length >= @len * 2
    @array.splice @len + 1

   @_traceDown 1
  return res

 push: (val) ->
  if @len < @array.length - 1
   @array[++@len] = val
  else
   @array.push val
   @len++
  @_traceUp @len

 _swap: (a, b) ->
  t = @array[a]
  @array[a] = @array[b]
  @array[b] = t
  return

 _traceUp: (pos) ->
  while pos > 1
   parent = Math.floor pos / 2
   com = @compare @array[pos], @array[parent]
   if com < 0
    @_swap pos, parent
    pos = parent
   else
    break
  return

 _traceDown: (pos) ->
  while true
   child = 0
   left = pos * 2
   if left > @len
    return
   com = @compare @array[left], @array[pos]
   if com < 0
    child = left
   right = left + 1
   if right <= @len
    if child > 0
     com = @compare @array[right], @array[left]
     if com < 0
      child = right
    else
     com = @compare @array[right], @array[pos]
     if com < 0
      child = right
   if child > 0
    @_swap child, pos
    pos = child
   else
    break
  return

if global? and not window?
 module.exports = Heap
else
 window.Heap = Heap

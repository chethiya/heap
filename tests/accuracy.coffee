N = 1000000
MAX_VAL = 1<<29

Heap = require '../heap'
arr = []
compare = (a, b) -> return a - b
heap = new Heap compare

for i in [0...N]
 v = Math.floor Math.random() * MAX_VAL
 arr.push v
 heap.push v

arr.sort compare
# console.log arr
# console.log heap.array


for i in [0...N]
 a = arr[i]
 b = heap.pop()
 # console.log heap.array
 if a isnt b
  console.log "Mismatch at the index #{i}"
console.log 'done'



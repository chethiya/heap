N = 10000000
MAX_VAL = 1<<29

Heap = require '../heap'

compare = (a, b) -> a - b
heap = new Heap compare
arr = []
res = []

for i in [0...N]
 v = Math.floor Math.random() * MAX_VAL
 arr.push v
 res.push v

console.time 'heap'
for i in [0...N]
 heap.push arr[i]
for i in [0...N]
 res[i] = heap.pop()
console.timeEnd 'heap'

console.time 'array'
arr.sort compare
console.timeEnd 'array'


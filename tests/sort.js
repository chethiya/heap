var Heap = require('minheap');
// Max heap
var heap = new Heap(function(a,b) {
 return b - a;
});
var N = 1<<20;
var MAX_VAL = 1<<29;
var K = 10
var arr = [];

// Generate random list
for (var i=0; i<N; ++i) {
 arr[i] = Math.floor(Math.random() * MAX_VAL);
}

// Finding Kth smallest in O(N log K) using the heap
for (var i=0; i<N; ++i) {
 if (i < K) {
  heap.push(arr[i]);
 } else {
  if (arr[i] < heap.top()) {
   r = heap.pop();
   heap.push(arr[i]);
  }
 }
}

console.log("10th smallest using heap: " + heap.top());

// Finding Kth smallest in O(N log N) by sorting the entire list
arr.sort(function(a,b) {
 return a - b;
});
console.log("10th smallest using sort: " + arr[K-1]);

// Monkey patch Array#myEach
Array.prototype.myEach = function(cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
}

// Monkey patch Array#myMap
Array.prototype.myMap = function(cb) {
  let mapped = [];
  for (let i = 0; i < this.length; i++) {
    mapped.push(cb(this[i]));
  }

  return mapped;
}

// Monkey patch Array#myReduce
Array.prototype.myReduce = function(cb, initialValue) {
  let arr = this;

  if (initialValue === undefined) {
    initialValue = this[0];
    arr = arr.slice(1);
  }

  let result = initialValue;

  arr.myEach(function(ele) {
    result = cb(result, ele);
  });

  return result;
};

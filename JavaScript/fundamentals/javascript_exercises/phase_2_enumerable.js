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
  let accumulator = initialValue || this[0];

  for (let i = 0; i < this.length; i++) {
    if (!arguments[1] && i === 0) { continue };
    accumulator = cb(accumulator, this[i])
  };

  return accumulator;
};

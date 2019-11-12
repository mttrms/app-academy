// Monkey patch Array#myEach
Array.prototype.myEach = function(cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
}

Array.prototype.myMap = function(cb) {
  mapped = [];
  for (let i = 0; i < this.length; i++) {
    mapped.push(cb(this[i]));
  }

  return mapped;
}

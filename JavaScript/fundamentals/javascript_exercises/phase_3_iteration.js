// Array#bubbleSort
Array.prototype.bubbleSort = function () {
  let sorted = false;
  let arr = this.slice();

  while (sorted === false) {
    sorted = true;

    for (let i = 0; i < arr.length; i++) {
      if (arr[i] > arr[i + 1]) {
        sorted = false;
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]]
      }
    }
  }

  return arr;
};

// String#substrings
String.prototype.substrings = function () {
  let substrings = [];

  for (let i = 0; i <= this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      substrings.push(this.substring(i, j));
    }  
  }

  return substrings;
}

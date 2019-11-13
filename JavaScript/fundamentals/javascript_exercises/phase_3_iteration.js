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

// range(start, end) - receives a start and end value, returns an array from start up to end
const range = (start, end) => {
  if (start === end) {
    return [];
  }

  let numRange = range(start, end - 1)
  numRange.push(end - 1);

  return numRange
}

// sumRec(arr) - receives an array of numbers and recursively sums them
const sumRec = (arr) => {
  if (arr.length === 1) {
    return arr[0];
  }

  return arr[0] + sumRec(arr.slice(1))
}

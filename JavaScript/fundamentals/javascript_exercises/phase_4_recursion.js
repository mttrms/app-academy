// range(start, end) - receives a start and end value, returns an array from start up to end
const range = (start, end) => {
  if (start === end) {
    return [];
  }

  let numRange = range(start, end - 1)
  numRange.push(end - 1);

  return numRange
}

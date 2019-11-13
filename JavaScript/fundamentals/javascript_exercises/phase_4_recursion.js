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

// exponent(base, exp) - receives a base and exponent, returns the base raise to the power of the exponent (base ^ exp)
const exponent = (base, exp) => {
  if (exp === 0) {
    return 1;
  }

  return base * exponent(base, exp - 1)
};

const funExponent = (base, exp) => {
  if (exp === 0) {
    return 1;
  }

  if (exp % 2 === 0) {
    return exponent(base, exp / 2) ** 2;
  } else {
    return base * (exponent(base, (exp - 1) / 2) ** 2)
  }
}

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

// fibonacci(n) - receives an integer, n, and returns the first n Fibonacci numbers
const fibonacci = (n) => {
  if (n === 1) {
    return [0];
  } else if (n === 2) {
    return [0, 1]
  }

  let fibs = fibonacci(n - 1);
  fibs.push(fibs[fibs.length - 2] + fibs[fibs.length - 1])

  return fibs;
}

console.log(fibonacci(3));
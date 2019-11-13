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

// deepDup(arr) - deep dup of an Array!
const deepDup = (arr) => {
  if (!(arr instanceof Array)) {
    return arr;
  }
  return arr.map(function (el) {
    return deepDup(el);
  });
}

// binarySearch(arr, target)
const binarySearch = (arr, target) => {
  if (arr.length === 0 ) {
    return -1;
  }

  let middleIdx = Math.floor(arr.length / 2);
  let middleVal = arr[middleIdx];

  if (middleVal === target) {
    return middleIdx;
  } else if (middleVal > target) {
    const lowerArr = arr.slice(0, middleIdx);
    return binarySearch(lowerArr, target);
  } else {
    const upperArr = arr.slice(middleIdx + 1);
    const upperSearch = binarySearch(upperArr, target);

    return upperSearch === -1 ? -1 : upperSearch + (middleIdx + 1);
  }
}

// mergeSort(arr)
const mergeSort = (arr) => {
  if (arr.length === 1) {
    return arr;
  } else {
    const midPoint = Math.floor(arr.length / 2);
    const left = mergeSort(arr.slice(0, midPoint));
    const right = mergeSort(arr.slice(midPoint));

    return merge(left, right)
  }
}

const merge = (left, right) => {
  const merged = [];

  while (left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) {
      merged.push(left.shift());
    } else {
      merged.push(right.shift());
    }
    // Better merge
    // let nextEle = (left[0] < right[0]) ? left.shift() : right.shift();
    // merged.push(nextEle);
  }

  return merged.concat(left, right);
}

// subsets(arr)
const subsets = (arr) => {
  if (arr.length === 0) {
    return [[]];
  }

  const last = arr[arr.length -1];
  const withoutLast = subsets(arr.slice(0, arr.length - 1));

  const withLast = withoutLast.map(function (ele) {
    return ele.concat([last]);
  })

  return withoutLast.concat(withLast);
}

const readline = require('readline')

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const askIfGreaterThan = (ele1, ele2, callback) => {
  reader.question(`Is ${ele1} > ${ele2}? (yes / no) `, function(response) {
    response === 'yes' ? callback(true) : callback(false);
  })
}

const innerBubbleSortLoop = (arr, i, madeAnySwaps, outerBubbleSortLoop) => {
  if (i === (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
      if (isGreaterThan) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        madeAnySwaps = true;
      } else {
        madeAnySwaps = false;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    })
  }
}

const absurdBubbleSort = (arr, sortCompletionCallback) => {
  console.log(`Starting array is: ${JSON.stringify(arr)}`);
  const outerBubbleSortLoop = (madeAnySwaps) => {
    if (madeAnySwaps === true) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }

  outerBubbleSortLoop(true);
}

absurdBubbleSort([5, 0, 2, 1, 4], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

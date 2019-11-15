const readline = require('readline')

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const askIfGreaterThan = (ele1, ele2, callback) => {
  reader.question(`Is ${ele1} > ${ele2}?`, function(response) {
    response === 'yes' ? callback(true) : callback(false);
  })
}

const innerBubbleSortLoop = (arr, i, madeAnySwaps, outerBubbleSortLoop) => {
  if (i === (arr.length - 1)) {
    outerBubbleSortLoop();
  } else {
    askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
      if (isGreaterThan) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        console.log('swapped')
        madeAnySwaps = true;
      } else {
        console.log('not swapped')
        madeAnySwaps = false;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    })
  }
}



const absurdBubbleSort = (arr, sortCompletionCallback) => {
}

let arr = [5, 1, 3, 2, 0, 4, 7];

innerBubbleSortLoop(arr, 0, false, function() {
  console.log('outer callback');
})


// askIfGreaterThan(10, 5, function(answer) {
//   console.log(answer);
// })
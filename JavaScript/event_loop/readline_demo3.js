const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function absurdTimesAsync (numTimes, fnAsync, completionFn) {
  let i = 0;

  function loopStep () {
    if (i == numTimes) {
      // we're done, stop looping
      completionFn();
      return;
    }

    i++;

    // fnAsync is an asynchronous function that takes a callback (in this case loopStep)
    fnAsync(loopStep);
  }

  loopStep();
}

function addTwoNumbersAsync(callback) {
  reader.question("Enter #1: ", function (numString1) {
    reader.question("Enter #2: ", function (numString2) {
      const num1 = parseInt(numString1);
      const num2 = parseInt(numString2);

      callback(num1 + num2);
    });
  });
}

let totalSum = 0;

function addTwoNumbersAndIncrementAsync(callback) {
  addTwoNumbersAsync(function (result) {
    totalSum += result;

    console.log(`Sum: ${result}`);
    console.log(`Total Sum: ${totalSum}`);

    callback();
  });
}

function outputResultAndCloseReader () {
  console.log(`All done! Total Sum: ${totalSum}`);
  reader.close();
}

absurdTimesAsync(3, addTwoNumbersAndIncrementAsync, outputResultAndCloseReader);


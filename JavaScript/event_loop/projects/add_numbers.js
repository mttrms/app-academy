const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const addNumbers = (sum, numsLeft, completionCallback) => {
  if (numsLeft === 0) {
    reader.close();
    return completionCallback(sum);
  } else {
    reader.question(`Enter a number (${numsLeft} remaining): `, function(response) {
      let num = parseInt(response);
      sum += num;
      numsLeft -= 1;

      console.log(`Current sum: ${sum}`);
      addNumbers(sum, numsLeft, completionCallback);
    });
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
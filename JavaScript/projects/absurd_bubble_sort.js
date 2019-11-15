const readline = require('readline')

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const absurdBubbleSort = (arr, sortCompletionCallback) => { 

}

const askIfGreaterThan = (ele1, ele2, callback) => {
  reader.question(`Is ${ele1} > ${ele2}?`, function(response) {
    response === 'yes' ? callback(true) : callback(false);
  })
}

askIfGreaterThan(10, 5, function(answer) {
  console.log(answer);
})
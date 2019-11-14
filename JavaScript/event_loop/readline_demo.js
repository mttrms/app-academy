const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

reader.question("What is your name?", function (answer) {
  console.log(`Hello ${answer}!`);

	// close the reader which allows program to end.
	// no longer waiting on any events.
	reader.close();
});

console.log("Last program line");

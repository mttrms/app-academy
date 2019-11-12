// Phase 1

function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

const madLib = (verb, adjective, noun) => {
	return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
}

const isSubstring = (searchString, subString) => {
	return searchString.includes(subString);
}

// Phase 2

const fizzBuzz = (array) => {
	return array.filter(function(num) {
		if (num % 3 === 0 && num % 5 === 0) {
			return false;
		} else if (num % 3 === 0 || num % 5 === 0) {
			return true;
		} 
	});
}

const isPrime = (number) => {
	for (let i = 2; i < num; i ++) {
		if (num % i === 0) {
			return false;
		}
	}

	return num < 2 ? false : true;
}

const firstNPrimes = (number) => {
  let primes = [];
  let i = 0;
  while (primes.length < number) {
    if (isPrime(i)) {
      primes.push(i)
    }
    i++;
  }

  return primes;
}

const sumOfNPrimes = (number) => {
	let primes = firstNPrimes(number);
	return primes.reduce((sum, num) => {
    return sum + num;
  }, 0);
}

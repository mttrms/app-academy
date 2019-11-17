// sum function that takes any number of arguments
const sum = (...nums) => {
	return nums.reduce((sum, num) => sum + num)
}

// write myBind with arguments
Function.prototype.myBind = function(ctx, ...args) {
	const bindArgs = Array.from(args);

	return (...args) => {
		args = bindArgs.concat(args)
		this.apply(ctx, args);
	}
}

class Cat {
	constructor(name) {
		this.name = name;
	}

	says(sound, person) {
		console.log(`${this.name} says ${sound} to ${person}!`)
		return true;
	}
}

class Dog {
	constructor(name) {
		this.name = name;
	}
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says.myBind(pavlov, "meow", "Kush")();
markov.says.myBind(pavlov)("meow", "a tree");
markov.says.myBind(pavlov, "meow")("Markov");

const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");

// curriedSum
const curriedSum = (numArgs) => {
	let numbers = [];

	const _curriedSum = (num) => {
		numbers.push(num);
		if (numbers.length === numArgs) {
			return numbers.reduce((sum, num) => sum + num);
		} else {
			return _curriedSum
		}
	}

	return _curriedSum;
}

// wait until 3 arguments are given before summng them.
let sumThree = curriedSum(3);
console.log(sumThree = sumThree(20));
console.log(sumThree = sumThree(2));
console.log(sumThree = sumThree(5));

// Function.prototype.curry
Function.prototype.curry = function(numArgs) {
	const args = [];

	const _curriedFn = (arg) => {
		args.push(arg);

		if (args.length === numArgs) {
			return this(...args);
		} else {
			return _curriedFn;
		}
	}

	return _curriedFn;
}

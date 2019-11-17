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
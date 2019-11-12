// Phase 1: Arrays

// Monkey patch Array#uniq
Array.prototype.uniq = function () {
	return this.reduce(function(acc, ele) {
		if (!acc.includes(ele)) {
			acc.push(ele);
		}

		return acc;
	}, [])
};

// Monkey patch Array#twoSum
Array.prototype.twoSum = function () {
	let pairs = []

	for (let i = 0; i < this.length; i++) {
		for (let j = i+1; j < this.length; j++) {
			if (this[i] + this[j] === 0) {
				twoSumPairs.push([i, j])
			}
		}
	}

	return pairs;
}

// Monkey patch Array#transpose
Array.prototype.transpose = function () {
	let transposed = [];

	// Alternative way to construct the transposed array:
	const columns = Array.from(
    { length: this[0].length },
    () => Array.from({ length: this.length })
  );

	for (let i = 0; i < this.length; i++) {
		for (let j = 0; j < this[i].length; j++) {
			if (transposed[j] == null) { transposed.push([]) }
			transposed[j][i] = this[i][j];
		}
	}

	return transposed;
}
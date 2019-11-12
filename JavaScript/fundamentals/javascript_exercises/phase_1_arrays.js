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
	pairs = []

	for (let i = 0; i < this.length; i++) {
		for (let j = i+1; j < this.length; j++) {
			if (this[i] + this[j] === 0) {
				twoSumPairs.push([i, j])
			}
		}
	}

	return pairs;
}

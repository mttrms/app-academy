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

const Util = {
  inherits(childClass, parentClass) {
    this.prototype = Object.create(parentClass.prototype);
    this.prototype.constructor = this;
  }
};

module.exports = Util;
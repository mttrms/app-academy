Function.prototype.inherits = function(superClass) {
  function Surrogate () {};
  Surrogate.prototype = superClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

Function.prototype.betterInherits = function(superclass) {
  this.prototype = Object.create(superclass.prototype);
  this.prototype.constructor = this;
}

function MovingObject (name) {
  this.name = name;
}

MovingObject.prototype.fly = function() {
  console.log(`${this.name} goes flying by!`);
}

function Ship (name, model) {
  MovingObject.call(this, name);
  this.model = model;
}

Ship.betterInherits(MovingObject);

Ship.prototype.fly = function() {
  console.log(`${this.name} screams by!`)
}

function Asteroid (name) {
  MovingObject.call(this, name)
}

Asteroid.inherits(MovingObject);

const obj = new MovingObject('mattObj');
const ast = new Asteroid('mattAsteroid');
const shp = new Ship('mattShip', 'X1');

obj.fly();
ast.fly();
shp.fly();

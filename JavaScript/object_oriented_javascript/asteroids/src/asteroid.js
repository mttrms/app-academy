const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

function Asteroid(pos) {
  MovingObject.call(this, {
    pos: pos,
    vel: [10, 10],
    radius: Asteroid.RADIUS,
    color: Asteroid.COLOR,
  })
}

Asteroid.COLOR = "#ff6ec7";
Asteroid.RADIUS = 25;

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
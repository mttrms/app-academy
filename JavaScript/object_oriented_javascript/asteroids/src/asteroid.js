const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

const DEFAULTS = {
  color: "#ff6ec7",
  radius: 25
}

function Asteroid(pos) {
  MovingObject.call(this, {
    pos: pos,
    vel: Util.randomVec(5),
    radius: DEFAULTS.radius,
    color: DEFAULTS.color
  })
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
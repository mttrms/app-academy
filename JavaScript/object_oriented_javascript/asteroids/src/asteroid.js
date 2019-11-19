const Util = require("./util.js");
const MovingObject = require("./moving_object.js");
const Ship = require("./ship.js");
const Bullet = require("./bullet.js")

const DEFAULTS = {
  color: "#ff6ec7",
  radius: 25
}

function Asteroid(options) {
  MovingObject.call(this, {
    game: options.game,
    pos: options.pos,
    vel: Util.randomVec(1),
    radius: DEFAULTS.radius,
    color: DEFAULTS.color
  })
}

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
  } else if (otherObject instanceof Bullet) {
    this.game.remove(this);
  }
}


module.exports = Asteroid;
const Util = require('./util.js')
const MovingObject = require("./moving_object.js");

const DEFAULTS = {
  color: "#3fc1c9",
  radius: 10
}

function Ship(options) {
  MovingObject.call(this, {
    game: options.game,
    pos: options.pos,
    vel: [0, 0],
    radius: DEFAULTS.radius,
    color: DEFAULTS.color
  });
}

Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
}


module.exports = Ship;
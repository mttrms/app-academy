const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

const DEFAULTS = {
  color: "#ffffff",
  radius: 2
}

const Bullet = function(options) {
  MovingObject.call(this, {
    pos: options.pos,
    vel: options.vel,
    radius: DEFAULTS.radius,
    color: DEFAULTS.color
  })
}

Util.inherits(Bullet, MovingObject);

module.exports = Bullet;
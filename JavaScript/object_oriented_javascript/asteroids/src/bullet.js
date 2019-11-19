const Util = require('./util.js');
const MovingObject = require('./moving_object.js');

const DEFAULTS = {
  color: "#ffffff",
  radius: 2
}

const Bullet = function(options) {
  MovingObject.call(this, {
    game: options.game,
    pos: options.pos,
    vel: options.vel,
    radius: DEFAULTS.radius,
    color: DEFAULTS.color
  })
}

Bullet.SPEED = 1;

Util.inherits(Bullet, MovingObject);

Bullet.prototype.isWrappable = false;

module.exports = Bullet;
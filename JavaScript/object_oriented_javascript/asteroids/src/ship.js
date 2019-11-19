const Util = require('./util.js')
const MovingObject = require("./moving_object.js");
const Bullet = require("./bullet.js");

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
  this.vel = [0, 0];
}

Ship.prototype.impulse = function(impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
}

Ship.prototype.fireBullet = function() {
  if (this.vel[0] === 0 && this.vel[1] === 0) {
    return;
  }

  const relativeVelocity = Util.scale(
    Util.dir(this.vel),
    Bullet.SPEED
  );

  const bulletVelocity = [
    relativeVelocity[0] + this.vel[0], relativeVelocity[1] + this.vel[1]
  ];

  const bullet = new Bullet({
    game: this.game,
    pos: this.pos.slice(),
    vel: bulletVelocity
  })

  this.game.addBullets(bullet);
}

module.exports = Ship;
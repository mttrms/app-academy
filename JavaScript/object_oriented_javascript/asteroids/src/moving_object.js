const Util = require("./util.js");

function MovingObject(options) {
  this.game = options.game;
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    Math.PI * 2,
    false
    );

  ctx.fillStyle = this.color;
  ctx.fill();
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];

  if (this.game.isOutOfBounds(this.pos)) {
    if (this.isWrappable) {
      this.pos = this.game.wrap(this.pos);
    }
  }
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  const distanceNeeded = (this.radius + otherObject.radius);
  const distanceBetween = Util.distanceBetween(this.pos, otherObject.pos);

  return distanceNeeded > distanceBetween;
}

MovingObject.prototype.collideWith = function(otherObject) {
}

MovingObject.prototype.isWrappable = true;

module.exports = MovingObject;
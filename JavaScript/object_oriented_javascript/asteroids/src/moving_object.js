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
  this.pos = this.game.wrap(this.pos);
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  const distanceNeeded = (this.radius + otherObject.radius);
  const distanceBetween = MovingObject.distanceBetween(this, otherObject);

  return distanceNeeded > distanceBetween;
}

MovingObject.prototype.collideWith = function(otherObject) {
}

MovingObject.distanceBetween = function(obj1, obj2) {
  const x1_pos = obj1.pos[0];
  const y1_pos = obj1.pos[1];
  const x2_pos = obj2.pos[0];
  const y2_pos = obj2.pos[1];

  return Math.sqrt((x2_pos - x1_pos)**2 + (y2_pos - y1_pos)**2);
}

module.exports = MovingObject;
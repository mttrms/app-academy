const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js");

function Game() {
  this.asteroids = [],
  this.bullets = [],
  this.addAsteroids(),
  this.ship = new Ship({
    game: this,
    pos: this.randomPosition()
  })
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    const asteroid = new Asteroid({pos: this.randomPosition(), game: this})
    this.asteroids.push(asteroid);
  }
}

Game.prototype.addBullets = function(bullet) {
  this.bullets.push(bullet);
}

Game.prototype.randomPosition = function() {
  const random_x = Math.random() * Game.DIM_X;
  const random_y = Math.random() * Game.DIM_Y;

  return [random_x, random_y]
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.allObjects().forEach((object) => {
    object.draw(ctx);
  })
}

Game.prototype.moveObjects = function() {
  this.allObjects().forEach((object) => {
      object.move();
  })
}

Game.prototype.wrap = function(pos) {
  let x_pos = pos[0];
  let y_pos = pos[1];

  if (x_pos < 0) {
    x_pos = Game.DIM_X;
  } else if (x_pos > Game.DIM_X) {
    x_pos = 0;
  }

  if (y_pos < 0) {
    y_pos = Game.DIM_Y;
  } else if (y_pos > Game.DIM_Y) {
    y_pos = 0;
  }

  return [x_pos, y_pos]
}

Game.prototype.checkCollisions = function() {
  for (let i = 0; i < this.allObjects().length; i++) {
    for (let j = i + 1; j < this.allObjects().length; j++) {
      const obj_1 = this.allObjects()[i];
      const obj_2 = this.allObjects()[j];

      if (obj_1.isCollidedWith(obj_2)) {
        obj_1.collideWith(obj_2);
      }
    }
  }
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
  const asteroidIdx = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(asteroidIdx, 1);
}

Game.prototype.allObjects = function() {
  return this.asteroids.concat([this.ship], this.bullets);
}

Game.prototype.isOutOfBounds = function(pos) {
  if (pos[0] < 0 || pos[0] > Game.DIM_X) {
    return true;
  } else if (pos[1] < 0 || pos[1] > Game.DIM_Y) {
    return true;
  }

  return false;
}

Game.DIM_X = 1200;
Game.DIM_Y = 800;
Game.NUM_ASTEROIDS = 15;

module.exports = Game;
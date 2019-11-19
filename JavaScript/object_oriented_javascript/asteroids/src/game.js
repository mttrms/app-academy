const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js");

function Game() {
  this.asteroids = [],
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

Game.prototype.randomPosition = function() {
  const random_x = Math.random() * Game.DIM_X;
  const random_y = Math.random() * Game.DIM_Y;

  return [random_x, random_y]
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.allObjects().forEach((asteroid) => {
    asteroid.draw(ctx);
  })
}

Game.prototype.moveObjects = function() {
  this.allObjects().forEach((asteroid) => {
    asteroid.move();
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
  this.allObjects().splice(asteroidIdx, 1);
}

Game.prototype.allObjects = function() {
  return this.asteroids.concat([this.ship]);
}

Game.DIM_X = 1200;
Game.DIM_Y = 800;
Game.NUM_ASTEROIDS = 15;

module.exports = Game;
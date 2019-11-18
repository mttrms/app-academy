const Asteroid = require("./asteroid.js");

function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    const asteroid = new Asteroid(this.randomPosition())
    this.asteroids.push(asteroid);
  }
}

Game.prototype.randomPosition = function() {
  const random_x = Math.random() * Game.DIM_X;
  const random_y = Math.random() * Game.DIM_Y;

  return [random_x, random_y]
}

Game.DIM_X = 1200;
Game.DIM_Y = 800;
Game.NUM_ASTEROIDS = 25;

module.exports = Game;
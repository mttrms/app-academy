const Game = require('./game.js');

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(() => {
    this.game.step();
    this.game.draw(this.ctx);
    this.bindKeyHandlers();
  }, 2)

  setInterval(() => {
    this.bindFireHandler();
  }, 250)
}

GameView.prototype.bindKeyHandlers = function() {
  const ship = this.game.ship;

  if (key.isPressed("a") || key.isPressed("left") || key.isPressed("h")) {
    ship.impulse([-.05, 0]);
  }

  if (key.isPressed("d") || key.isPressed("right") || key.isPressed("l")) {
    ship.impulse([.05, 0]);
  }

  if (key.isPressed("w") || key.isPressed("up") || key.isPressed("k")) {
    ship.impulse([0, -.05]);
  }

  if (key.isPressed("s") || key.isPressed("down") || key.isPressed("j")) {
    ship.impulse([0, .05]);
  }
}

GameView.prototype.bindFireHandler = function() {
  const ship = this.game.ship;

  if (key.isPressed("space")) {
    ship.fireBullet();
  }
}

module.exports = GameView;
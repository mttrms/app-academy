const Game = require('./game.js');

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(() => {
    this.game.moveObjects();
    this.game.draw(ctx);
  }, 10)
}

module.exports = GameView;
const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");

window.addEventListener('DOMContentLoaded', () => {
  const gameCanvas = document.getElementById('game-canvas');
  const ctx = gameCanvas.getContext('2d');

  window.MovingObject = MovingObject;
  window.Asteroid = Asteroid;
  window.Game = Game;
  window.ctx = ctx;
});

const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

window.addEventListener('DOMContentLoaded', () => {
  const gameCanvas = document.getElementById('game-canvas');
  const ctx = gameCanvas.getContext('2d');

  window.MovingObject = MovingObject;
  window.Asteroid = Asteroid;
  window.ctx = ctx;
});

const MovingObject = require("./moving_object.js");

window.addEventListener('DOMContentLoaded', () => {
  const gameCanvas = document.getElementById('game-canvas');
  const ctx = gameCanvas.getContext('2d');

  window.MovingObject = MovingObject;
  window.ctx = ctx;
});

// Remove later - but needed for debugging:
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor(numOfDiscs) {
    this.towers = _makeTowers(numOfDiscs);
  }
}

Game.prototype.promptMove = function () {
  this.print();
  console.log('Pick towers to move a disc from -> to (Example: 1, 3)')
  reader.question('Make your move: ', (response) => {
    this.validateMove(response);
  })
}

Game.prototype.print = function () {
  this.towers.forEach((tower, idx) => {
    console.log(`Tower ${idx}: ${JSON.stringify(tower)}`);
  })
}

Game.prototype.validateMove = function(move) {
  move = move.replace(/ /g,'').split(',');
  console.log(`Start idx: ${move[0]}`);
  console.log(`End idx: ${move[1]}`);
}

const _makeTowers = (numOfDiscs) => {
  return [
    Array.from({length: numOfDiscs}, (x, i) => i + 1).reverse(),
    [],
    []
  ]
}

const game = new Game(4);
game.promptMove();
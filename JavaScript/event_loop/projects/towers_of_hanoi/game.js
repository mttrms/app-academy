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
    move = response.replace(/ /g,'').split(',').map((num) => parseInt(num));
    this.isValidMove(move[0], move[1]);
  })
}

Game.prototype.print = function () {
  this.towers.forEach((tower, idx) => {
    console.log(`Tower ${idx}: ${JSON.stringify(tower)}`);
  })
}

Game.prototype.isValidMove = function(startIdx, endIdx) {
  startTower = this.towers[startIdx];
  endTower = this.towers[endIdx];
  startTowerDisc = startTower[startTower.length - 1]
  endTowerDisc = endTower[endTower.length - 1] || 0
  
  if (startTower.length === 0 || endTowerDisc > startTowerDisc) {
    return false;
  } else {
    return true;
  }
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
const Board = require('./board');

class Game {
  constructor(reader, playerX, playerO) {
    this.reader = reader,
    this.playerX = playerX,
    this.playerO = playerO,
    this.currentPlayer = playerX,
    this.board = new Board
  }

  promptMove(callback) {
    this.reader.question('Make your move', (response) => {
      const move = response
                   .replace(/ /g, '')
                   .split(",")
                   .map((num) => parseInt(num));

      callback(move);
    });
  }

  run(reader, completionCallback) {
    this.board.print();
    game.promptMove((response) => {
      this.board.place_mark(response, this.currentPlayer.mark);
      if (this.board.winner()) {
        this.board.print();
        completionCallback(this.currentPlayer.mark);
      } else {
        this.swap_players();
        this.run(reader, completionCallback);
      }
    });
  }

  swap_players() {
    if (this.currentPlayer === this.playerX) {
      this.currentPlayer = this.playerO;
    } else {
      this.currentPlayer = this.playerX;
    }
  }
}

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Player {
  constructor(mark) {
    this.mark = mark
  }
}

const player1 = new Player("x");
const player2 = new Player("o");

const game = new Game(reader, player1, player2);
game.run(reader, (winner) => {
  console.log("game over")
});
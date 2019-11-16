const Board = require('./board');

class Game {
  constructor(reader) {
    this.reader = reader,
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
      this.board.place_mark(response, "x")
      if (this.board.won()) {
        completionCallback();
      } else {
        this.run(reader, completionCallback)
      }
    });

  }
}

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const game = new Game(reader);
game.run(reader, () => {
  console.log("game over")
});
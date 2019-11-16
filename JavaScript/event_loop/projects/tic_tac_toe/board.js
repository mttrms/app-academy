class Board {
  constructor() {
    this._grid = [[], [], []]
  }

  winner() {

  }

  won() {

  }

  empty(pos) {
    const [row, col] = pos;

    return this._grid[row][col] === undefined;
  }

  valid(pos) {
    return !pos.some(coord => coord < 0 || coord > 2 );
  }

  place_mark(pos, mark) {
    if (this.empty(pos) && this.valid(pos)) {
      const [row, col] = pos;
      this._grid[row][col] = mark;
    } else {
      throw Error('Invalid placement.')
    }
  }
}


const board = new Board
// console.log(board.empty([0,0]))
console.log(board.valid([0, 0]))
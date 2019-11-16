class Board {
  constructor() {
    this._grid = [
      new Array(3).fill('_'),
      new Array(3).fill('_'),
      new Array(3).fill('_')
    ]
  }

  winner() {
    let winner = false;

    const triples = this._diagonals().concat(this._rows(), this._cols());
    for (let i = 0; i < triples.length; i++) {
      let triple = triples[i];

      if (triple.every((v) => {
        return v === 'x' || v === 'o'
      })) {
        winner = triple[0];
        break;
      }
    }

    return winner;
  }

  won() {
    return this.winner() === false ? false : true;
  }

  empty(pos) {
    const [row, col] = pos;

    return this._grid[row][col] === '_';
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

  print() {
    this._grid.forEach((row) => {
      console.log(row);
    })
  }

  _rows(){ 
    return this._grid;
  }

  _cols() {
    const cols = [[], [], []]

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        cols[j].push(this._grid[i][j])
      }
    }

    return cols;
  }

  _diagonals() {
    const diagonal_down = [[0, 0], [1, 1], [2, 2]];
    const diagonal_up = [[2, 0], [1, 1], [0, 2]];
    const diagonals = [diagonal_down, diagonal_up];

    return diagonals.map((diagonal) => {
      return diagonal.map((space) => {
        return this._grid[space[0]][space[1]];
      })
    })
  }
}

module.exports = Board;
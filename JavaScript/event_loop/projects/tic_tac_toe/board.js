class Board {
  constructor() {
    this._grid = [
      new Array(3).fill('_'),
      new Array(3).fill('_'),
      new Array(3).fill('_')
    ]
  }

  winner() {
    const posSeqs = [
      // rows
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      // cols
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      // diagonals
      [[0, 0], [1, 1], [2, 2]],
      [[2, 0], [1, 1], [0, 2]]
    ];

    for (let i = 0; i < posSeqs.length; i++) {
      const winner = this.winnerHelper(posSeqs[i]);
      if (winner != null) {
        return winner;
      }
    }

    return null;
  }

  winnerHelper(posSeq) {
    for (let markIdx = 0; markIdx < Board.marks.length; markIdx++) {
      const targetMark = Board.marks[markIdx];
      let winner = true;
      for (let posIdx = 0; posIdx < 3; posIdx++) {
        const pos = posSeq[posIdx];
        const mark = this._grid[pos[0]][pos[1]];

        if (mark != targetMark) {
          winner = false;
        }
      }

      if (winner) {
        return targetMark;
      }
    }

    return null;
  }

  won() {
    return this.winner() === null ? false : true;
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
}

Board.marks = ['x', 'o'];

module.exports = Board;
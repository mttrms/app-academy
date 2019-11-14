let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  const grid = []

  for (let i = 0; i < 8; i++) {
    grid.push([]);
    for (let j = 0; j < 8; j++) {
      grid[i].push(undefined);
    }
  }

  grid[3][3] = new Piece('white');
  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece('black');
  grid[4][4] = new Piece('white');

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw new Error("Not valid pos!");
  } else {
    const [row, col] = pos;
    return this.grid[row][col];
  }
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length > 0 ? true : false;
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  const [row, col] = pos;

  if (this.isOccupied(pos) && this.grid[row][col].color === color) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  const [row, col] = pos;

  return this.grid[row][col] instanceof Piece;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (this.hasMove('white') || this.hasMove('black')) {
    return false;
  } else {
    return true;
  }
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  const invalidCoords = pos.filter(function(coordinate) {
    return (coordinate < 0 || coordinate > 7)
  })

  return (invalidCoords.length > 0) ? false : true;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  pos = [pos[0] + dir[0], pos[1] + dir[1]]

  if (!board.isValidPos(pos) || !board.isOccupied(pos)) {
    return null;
  } else if (board.isMine(pos, color)) {
    return piecesToFlip.length === 0 ? null : piecesToFlip;
  } else {
  
    piecesToFlip.push(pos);
    return _positionsToFlip(board, pos, color, dir, piecesToFlip);
  }
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (this.validMove(pos, color)) {
    let row = pos[0]
    let col = pos[1]
    this.grid[row][col] = new Piece(color);

    let piecesToFlip = [];

    Board.DIRS.forEach((dir) => {
      // note to self: look into `this` scoping and ES5/ES6 function differences
      let result = _positionsToFlip(this, pos, color, dir, [])

      if (result) {
        result.forEach(function (pos) {
          piecesToFlip.push(pos)
        })
      }
    })

    for (let i = 0; i < piecesToFlip.length; i++) {
      let [row, col] = piecesToFlip[i];
      this.grid[row][col].flip(); 
    }
  } else {
    throw new Error("Invalid move.");
  } 
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  // gameHeader = [' ', '0', '1', '2', '3', '4', '5', '6', '7']
  let gameHeader = "  0 1 2 3 4 5 6 7"
  console.log(gameHeader)
  for (let i = 0; i < this.grid.length; i++) {
    row = ""
    row += String(i);
    for (let j = 0; j < this.grid.length; j++) {
      let piece = this.grid[i][j];
      row += (
        piece ? ` ${piece.toString()}` : ' _'
      );
    }
    console.log(row);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  for (let i = 0; i < Board.DIRS.length; i++) {
    const dir = Board.DIRS[i];
    if (_positionsToFlip(this, pos, color, dir, [])) {
      return true;
    }
  }

  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let moves = [];

  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++) {
      let pos = [i, j];
      
      if (this.isOccupied(pos)) {
        continue;
      } else if (this.validMove(pos, color)) {
        moves.push(pos)
      }
    }
  }

  return moves
};

module.exports = Board;

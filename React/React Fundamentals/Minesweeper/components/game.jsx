import React from 'react';
import Board from './board';
import * as Minesweeper from '../minesweeper';

class Game extends React.Component {
  constructor(props) {
    super(props);
    const board = new Minesweeper.Board(10, 6);
    this.state = { board };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, flagging) {
    if (flagging) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState({ board: this.state.board });
  }

  render() {
    const board = this.state.board;
    if (board.lost()) {
      alert('loser!');
    } else if (board.won()) {
      alert('winner!');
    }

    return (
      <div className="game">
        <Board boardState={this.state.board} update={this.updateGame} />
      </div>
    )
  }
}

export default Game;

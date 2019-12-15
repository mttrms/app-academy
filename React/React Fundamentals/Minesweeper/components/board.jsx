import React from 'react';
import Tile from './tile';

class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const grid = this.props.boardState.grid;
    const update = this.props.update;
    const tiles = grid.map((row, rowIdx) => (
      <div className="row" key={rowIdx}>
        {row.map((tile, tileIdx) => (
          <Tile tileObject={tile} updateGame={update} key={tileIdx}/>
        ))}
      </div>
    ));

    return(
      <div className="board">
        {tiles}
      </div>
    )
  }
}

export default Board;

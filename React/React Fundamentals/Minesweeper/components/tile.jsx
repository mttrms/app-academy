import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.tile = this.props.tileObject;
    this.updateGame = this.props.updateGame;
    this.handleClick = this.handleClick.bind(this);
    this.classes = this.classes.bind(this);
  }

  handleClick(e) {
    const isAltPushed = e.altKey;
    this.updateGame(this.tile, isAltPushed);
  }

  classes() {
    const classList = {
      tile: true,
      explored: this.tile.explored,
      hidden: !this.tile.explored,
      flagged: this.tile.flagged,
      bombed: this.tile.explored && this.tile.bombed
    }

    return Object.keys(classList).reduce((arr, className) => {
      if (classList[className]) {
        arr.push(className);
      }

      return arr;
    }, [])
  }

  render() {

    return(
      <div
        className={ this.classes().join(' ') }
        onClick={ this.handleClick }
      >
        {this.tile.explored ? this.tile.adjacentBombCount() : ""}
      </div>
    )
  }
}

export default Tile;

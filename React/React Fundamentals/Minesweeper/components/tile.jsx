import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.tile = this.props.tileObject;
    this.classes = this.classes.bind(this);
  }

  classes() {
    const classList = {
      tile: true,
      explored: this.tile.explored,
      hidden: !this.tile.explored,
      flagged: this.tile.flagged
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
      >
        {this.tile.explored ? this.tile.adjacentBombCount() : ""}
      </div>
    )
  }
}

export default Tile;

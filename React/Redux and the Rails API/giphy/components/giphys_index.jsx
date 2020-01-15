import React from 'react';
import PropTypes from 'prop-types';

class GiphysIndex extends React.Component {
  render() {
    console.log(this.props.giphys);

    const gifs = this.props.giphys.map(gif => {
      return (
        <GiphysIndexItem
          key={gif.id}
          gif={gif}
        />
      )
    });

    return (
      <div>
        { gifs }
      </div>
    )
  }
}

export default GiphysIndex;

GiphysIndex.propTypes = {
  giphys: PropTypes.array
}

import GiphysIndexItem from './giphys_index_item';

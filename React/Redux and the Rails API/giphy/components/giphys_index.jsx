import React from 'react';
import PropTypes from 'prop-types';

class GiphysIndex extends React.Component {
  render() {
    const gifs = this.props.giphys.map(gif => {
      return (
        <div
          key={gif.id}
        >
          <GiphysIndexItem
            gif={gif}
          />
        </div>
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

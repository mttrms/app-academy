import React from 'react';
import PropTypes from 'prop-types';

class GiphysIndex extends React.Component {
  render() {
    console.log(this.props.giphys);

    return (
      <p>Gifs coming soon!</p>
    )
  }
}

export default GiphysIndex;

GiphysIndex.propTypes = {
  giphys: PropTypes.array
}

import GiphysIndexItem from './giphys_index_item';

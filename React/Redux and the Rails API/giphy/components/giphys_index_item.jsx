import React from 'react';
import PropTypes from 'prop-types';

const GiphysIndexItem = props => {
  const { gif } = props;
  return <img src={gif.images.original.url} />
};

GiphysIndexItem.propTypes = {
  gif: PropTypes.object
}

export default GiphysIndexItem;

import React from 'react';
import PropTypes from 'prop-types';

const GiphysIndexItem = ({ gif }) => (
  <img src={gif.images.original.url} />
);

GiphysIndexItem.propTypes = {
  gif: PropTypes.object
}

export default GiphysIndexItem;

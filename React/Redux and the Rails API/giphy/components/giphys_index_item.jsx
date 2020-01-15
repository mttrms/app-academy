import React from 'react';
import PropTypes from 'prop-types';

const GiphysIndexItem = props => {
  return <h1>{props.gif.url}</h1>
};

GiphysIndexItem.propTypes = {
  gif: PropTypes.object
}

export default GiphysIndexItem;

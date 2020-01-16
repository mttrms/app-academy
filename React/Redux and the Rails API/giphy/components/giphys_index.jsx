import React from 'react';
import PropTypes from 'prop-types';
import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => (
  <div>
    {
      giphys.map(gif => (
        <div key={gif.id}>
          <GiphysIndexItem gif={gif}/>
        </div>
      ))
    }
  </div>
);



export default GiphysIndex;

GiphysIndex.propTypes = {
  giphys: PropTypes.array
}


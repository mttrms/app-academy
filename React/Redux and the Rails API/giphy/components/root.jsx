import React from 'react';
import PropTypes from 'prop-types';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

const Root = ({ store }) => {
  return (
  <Provider store={store}>
    <GiphysSearchContainer />
  </Provider>
  );
};

Root.propTypes = {
  store: PropTypes.object
};

export default Root;

import React from 'react';
import { Provider } from 'react-redux';

const Root = ({ store }) => (
  <Provider store={store}>
    <div>Welcome to the Pokedex</div>
  </Provider>
);

export default Root;

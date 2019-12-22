import React from 'react';
import { Provider } from 'react-redux';
import App from './app';
import todoListContainer from './todos/todo_list_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <App />
  </Provider>
);

export default Root;

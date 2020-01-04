import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root';
import { configureStore } from './frontend/store/store';

const addLoggingToDispatch = (store) => {
  const dispatch = store.dispatch;

  return function(action) {
    console.log(store.getState());
    console.log(action);
    dispatch(action);
    console.log(store.getState());
  };
};

document.addEventListener('DOMContentLoaded', () => {
  const rootElement = document.getElementById('content');

  const store = configureStore();
  store.dispatch = addLoggingToDispatch(store);
  window.store = store;

  ReactDOM.render(
    <Root store={store} />,
    rootElement
  );
});

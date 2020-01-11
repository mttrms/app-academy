import React from 'react';
import ReactDOM from 'react-dom';
import Root from '../frontend/components/root';
import { configureStore } from '../frontend/store/store';

const addLoggingToDispatch = store => next => action => {
  console.log(action);
  console.log(store.getState());

  let result = next(action);

  console.log(store.getState());

  return result;
};

const applyMiddlewares = (store, middlewares) => {
  let dispatch = store.dispatch;

  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });

  return Object.assign({}, store, { dispatch });
};

document.addEventListener('DOMContentLoaded', () => {
  const rootElement = document.getElementById('content');

  let store = configureStore();
  window.store = store;

  ReactDOM.render(
    <Root store={store} />,
    rootElement
  );
});

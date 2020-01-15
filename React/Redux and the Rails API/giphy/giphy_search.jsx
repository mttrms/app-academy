import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  const rootElement = document.getElementById('root');

  ReactDOM.render(
    <Root store={store} />,
    rootElement
  );
});

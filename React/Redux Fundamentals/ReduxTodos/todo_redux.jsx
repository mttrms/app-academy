import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root';
import { configureStore } from './frontend/store/store';

window.store = configureStore();

document.addEventListener('DOMContentLoaded', () => {
  const rootElement = document.getElementById('content');

  ReactDOM.render(
    <Root store={configureStore()} />,
    rootElement
  );
});

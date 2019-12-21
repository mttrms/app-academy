import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root';
import { configureStore } from './frontend/store/store';
import { receiveTodos, receiveTodo } from './frontend/actions/todo_actions';

window.store = configureStore();
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;

document.addEventListener('DOMContentLoaded', () => {
  const rootElement = document.getElementById('content');

  ReactDOM.render(
    <Root store={configureStore()} />,
    rootElement
  );
});

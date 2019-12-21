import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './frontend/store/store';
import { receiveTodos, receiveTodo } from './frontend/actions/todo_actions';

window.store = configureStore();
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;

const TodoApp = () => (
  <h1>Todos App</h1>
);

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <TodoApp />,
    document.getElementById('content')
  );
});

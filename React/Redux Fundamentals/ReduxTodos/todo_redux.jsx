import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodos, RECEIVE_TODOS } from './frontend/actions/todo_actions.js';

const TodoApp = () => (
  <h1>Todos App</h1>
);

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <TodoApp />,
    document.getElementById('content')
  );
});

import React from 'react';
import ReactDOM from 'react-dom';

const TodoApp = () => (
  <h1>Todos App</h1>
);

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <TodoApp />,
    document.getElementById('content')
  );
});

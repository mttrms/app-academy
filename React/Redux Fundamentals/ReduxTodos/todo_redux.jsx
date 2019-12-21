import React from 'react';
import ReactDOM from 'react-dom';
import rootReducer from './frontend/reducers/root_reducer';

const TodoApp = () => (
  <h1>Todos App</h1>
);

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <TodoApp />,
    document.getElementById('content')
  );
});

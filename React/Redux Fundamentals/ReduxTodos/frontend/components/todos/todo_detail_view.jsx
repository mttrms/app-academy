import React from 'react';

const TodoDetailView = ({ todo, removeTodo }) => {
  return (
    todo.detail ?
      <ul>
        <li>{ todo.body }</li>
      </ul>:
    ""
  )
};

export default TodoDetailView;

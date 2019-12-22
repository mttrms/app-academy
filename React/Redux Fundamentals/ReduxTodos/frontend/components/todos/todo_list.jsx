import React from 'react';

const Todos = ({ todos  }) => {
  const todoItems = todos.map((todo, idx) => (
    <li key={idx}>{todo.title}</li>
  ));

  return (
    <div>
      <h3>Todo Items:</h3>
      <ul>
        { todoItems }
      </ul>
    </div>
  );
};

export default Todos;

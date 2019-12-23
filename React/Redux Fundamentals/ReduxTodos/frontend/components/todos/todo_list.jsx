import React from 'react';
import TodoListItem from './todo_list_item.jsx';

const Todos = ({ todos  }) => {
  const todoItems = todos.map((todo, idx) => (
    <TodoListItem key={idx} todo={todo} />
    // <li key={idx}>{todo.title}</li>
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

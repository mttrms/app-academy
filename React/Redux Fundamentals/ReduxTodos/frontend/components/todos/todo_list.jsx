import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';


const Todos = ({ todos, receiveTodo, removeTodo }) => {
  const todoItems = todos.map((todo, idx) => (
    <TodoListItem
      key={idx}
      todo={todo}
      removeTodo={removeTodo}
      receiveTodo={receiveTodo}
    />
  ));

  return (
    <div>
      <h3>Todo Items:</h3>
      <ul>
        { todoItems }
      </ul>
      <TodoForm receiveTodo={receiveTodo} />
    </div>
  );
};

export default Todos;

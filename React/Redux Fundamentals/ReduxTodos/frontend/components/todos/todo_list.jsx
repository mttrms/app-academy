import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';


const Todos = ({ todos, receiveTodo }) => {
  const todoItems = todos.map((todo, idx) => (
    <div key={idx}>
      <TodoListItem
        todo={todo}
        receiveTodo={receiveTodo}
      />
    </div>
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

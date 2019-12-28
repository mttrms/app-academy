import React from 'react';
import TodoListItem from './todo_list_item';
import TodoDetailView from './todo_detail_view';
import TodoForm from '../todo_list/todo_form';


const Todos = ({ todos, receiveTodo, removeTodo }) => {
  const todoItems = todos.map((todo, idx) => (
    <div key={idx}>
      <TodoListItem
        todo={todo}
        removeTodo={removeTodo}
        receiveTodo={receiveTodo}
      />

      {todo.detail ? <TodoDetailView todo={todo} /> : ""}
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

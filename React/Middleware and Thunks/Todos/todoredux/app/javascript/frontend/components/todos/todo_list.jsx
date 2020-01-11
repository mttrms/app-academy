import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const todoItems = this.props.todos.map((todo, idx) => (
      <div key={idx}>
        <TodoListItem
          todo={todo}
          receiveTodo={this.props.receiveTodo}
        />
      </div>
    ));

    return (
      <div>
        <h3>Todo Items:</h3>
        <ul>
          { todoItems }
        </ul>
        <TodoForm receiveTodo={this.props.receiveTodo} />
      </div>
    );
  }
}

export default TodoList;

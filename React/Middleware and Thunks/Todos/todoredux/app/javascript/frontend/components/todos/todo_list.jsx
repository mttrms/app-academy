import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    const todoItems = this.props.todos.map((todo, idx) => (
      <div key={idx}>
        <TodoListItem
          todo={todo}
          receiveTodo={this.props.receiveTodo}
          updateTodo={this.props.updateTodo}
        />
      </div>
    ));

    return (
      <div>
        <h3>Todo Items:</h3>
        <ul>
          { todoItems }
        </ul>
        <TodoForm
          receiveTodo={this.props.receiveTodo}
          createTodo={this.props.createTodo}
          errors={this.props.errors}
        />
      </div>
    );
  }
}

export default TodoList;

import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const todo = this.props.todo;

    return (
      <li>{todo.title} <input type="button" value="Delete" onClick={() => this.props.removeTodo(todo)}/></li>
    )
  }
}

export default TodoListItem;

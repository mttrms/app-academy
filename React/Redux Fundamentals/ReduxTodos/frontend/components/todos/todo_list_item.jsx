import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const todo = this.props.todo;

    return (
      <li>{todo.title}</li>
    )
  }
}

export default TodoListItem;

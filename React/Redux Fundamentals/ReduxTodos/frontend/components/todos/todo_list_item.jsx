import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.updateTodo = this.updateTodo.bind(this);
  }

  updateTodo(todo) {
    const updatedTodo = Object.assign({}, todo);
    updatedTodo.done = !updatedTodo.done;
    this.props.receiveTodo(updatedTodo);
  }

  render() {
    const todo = this.props.todo;

    return (
      <li>
        {todo.title}
        <input
          type="button"
          value={todo.done ? "Undo" : "Done"}
          onClick={() => this.updateTodo(todo)}
        />
      </li>
    )
  }
}

export default TodoListItem;

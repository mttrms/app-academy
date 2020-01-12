import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.updateTodo = this.updateTodo.bind(this);
    this.displayDetails = this.displayDetails.bind(this);
    this.state = {detail: false};
  }

  updateTodo(todo) {
    const updatedTodo = Object.assign({}, todo);
    updatedTodo.done = !updatedTodo.done;
    this.props.updateTodo(updatedTodo);
  }

  displayDetails() {
    const detail = this.state.detail;
    this.setState({detail: !detail});
  }

  render() {
    const todo = this.props.todo;

    return (
      <li>
        <span
          onClick={() => this.displayDetails()}
        >
          {todo.title}
        </span>
        <input
          type="button"
          value={todo.done ? "Undo" : "Done"}
          onClick={() => this.updateTodo(todo)}
        />
        {this.state.detail ? <TodoDetailViewContainer todo={todo} /> : ""}
      </li>
    )
  }
}

export default TodoListItem;

import React from 'react';
import uniqueId from '../../util/util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: ''};
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    const title = e.target.value;
    this.setState({title});
  }

  handleSubmit(e) {
    e.preventDefault();

    const title = this.state.title;
    this.props.receiveTodo({
      id: uniqueId(),
      title: this.state.title,
      done: false,
      detail: false
    });

    this.setState({title: ''});
  }

  render() {

    return(
      <form onSubmit={this.handleSubmit}>
        <input type="text" value={this.state.title} onChange={this.handleInput} />
        <input type="submit" value="Add todo" />
      </form>
    )
  }
}

export default TodoForm;

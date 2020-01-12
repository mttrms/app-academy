import React from 'react';
import uniqueId from '../../util/util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: '', body: ''};
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    const inputProp = e.target.id;
    const inputValue = e.target.value;
    this.setState({[inputProp]: inputValue});
  }

  handleSubmit(e) {
    e.preventDefault();

    const title = this.state.title;
    this.props.createTodo({
      title: this.state.title,
      body: this.state.body,
      done: false,
      detail: false
    }).then(
      () => this.setState({title: '', body: ''})
    );
  }

  render() {

    return(
      <div>
        <h2>Add a todo:</h2>
        { this.props.errors ?
          <p>{this.props.errors}</p> :
          null
        }
        <form onSubmit={this.handleSubmit}>
          <label>Title:
            <input
              id="title"
              type="text"
              value={this.state.title}
              onChange={this.handleInput} />
          </label>
          <br />

          <label>Body:
            <textarea
              id="body"
              onChange={this.handleInput}
              value={this.state.body}
            ></textarea>
          </label>
          <br />

          <input type="submit" value="Add todo" />
        </form>
      </div>
    )
  }
}

export default TodoForm;

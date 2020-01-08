import React from 'react';
import uniqueId from '../../util/util';

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {stepTitle: ''};
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    const stepTitle = e.target.value;
    this.setState({stepTitle});
  }

  handleSubmit(e) {
    e.preventDefault();

    this.props.receiveStep({
      id: uniqueId(),
      todoId: this.props.todoId,
      title: this.state.stepTitle,
      done: false
    });

    this.setState({stepTitle: ''});
  }

  render() {

    return(
      <form
        onSubmit={this.handleSubmit}
      >
        <input
          type="text"
          value={this.state.stepTitle}
          onChange={this.handleInput}
        />
        <input type="submit" value="Add step" />
      </form>
    )
  }
}

export default StepForm;

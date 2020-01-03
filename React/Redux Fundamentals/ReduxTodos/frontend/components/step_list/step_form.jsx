import React from 'react';

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {stepTitle: ''};
  }

  render() {

    return(
      <form>
        <input type="text" value={this.props.todoId}/>
        <input type="submit" value="Add step" />
      </form>
    )
  }
}

export default StepForm;

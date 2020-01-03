import React from 'react';

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.step = this.props.step;
  }

  render() {
    return (
      <li>{this.step.title}</li>
    )
  }
}

export default StepListItem;

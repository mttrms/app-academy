import React from 'react';

class StepListItem extends React.Component {
  constructor(props) {
    super(props);
    this.receiveStep = this.props.receiveStep;
    this.removeStep = this.props.removeStep;
    this.updateStep = this.updateStep.bind(this);
  }

  updateStep(step) {
    const updatedStep = Object.assign({}, step);
    updatedStep.done = !updatedStep.done;
    this.receiveStep(updatedStep);
  }

  render() {
    const step = this.props.step;

    return (
      <li>
        <span>
          {step.title}
        </span>

        <input
          type="button"
          value={step.done ? "Undo" : "Done"}
          onClick={() => this.updateStep(step)}
        />

        <input
          type="button"
          value="Remove"
          onClick={() => this.removeStep(step)}
        />
      </li>
    )
  }
}

export default StepListItem;

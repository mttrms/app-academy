import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

class StepList extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const {steps, todoId, receiveStep} = this.props;

    const stepItems = steps.map(step => (
      <StepListItemContainer
        key={step.id}
        step={step}
      />
    ));

    return (
      <div>
        <ul>
          { stepItems }
        </ul>
        <StepForm
          todoId={todoId}
          receiveStep={receiveStep}
        />
      </div>
    )

  }
}

export default StepList;

import React from 'react';
import StepListItemContainer from './step_list_item_container';

const StepList = ({steps, todoId, receiveStep}) => {
  const stepItems = steps.map(step => (
  <StepListItemContainer
    key={step.id}
    step={step}
  />
  ));

  return (
    <ul>
      { stepItems }
    </ul>
  )
};

export default StepList;


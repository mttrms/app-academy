import React from 'react';

const StepList = ({steps, todoId, receiveStep}) => {
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
    </div>
  )
};

export default StepList;


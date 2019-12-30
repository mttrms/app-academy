import React from 'react';

const StepListItem = ({step, removeStep, receiveStep}) => {
  return (
    <p>{step.title}</p>
  )
};

export default StepListItem;

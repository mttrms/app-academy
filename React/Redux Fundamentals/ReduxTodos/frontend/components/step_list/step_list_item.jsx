import React from 'react';

const StepListItem = ({step, removeStep, receiveStep}) => {
  return (
    <li>{step.title}</li>
  )
};

export default StepListItem;

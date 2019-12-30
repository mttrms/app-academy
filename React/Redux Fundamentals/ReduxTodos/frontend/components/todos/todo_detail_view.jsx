import React from 'react';
import StepListContainer from '../step_list/step_list_container';
import { stepsByTodoId } from '../../reducers/selectors'

const TodoDetailView = ({ todo, removeTodo }) => {
  const todoId = todo.id;
  console.log(todoId);
  return (
    <ul>
      <li>{ todo.body }</li>
      <StepListContainer
      />
    </ul>
  )
};

export default TodoDetailView;

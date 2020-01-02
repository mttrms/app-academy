import React from 'react';
import StepListContainer from '../step_list/step_list_container';
import { stepsByTodoId } from '../../reducers/selectors'

const TodoDetailView = ({ todo, removeTodo }) => {
  const todoId = todo.id;

  return (
    <div>
      <StepListContainer
        todoId={todoId}
      />
    </div>
  )
};

export default TodoDetailView;

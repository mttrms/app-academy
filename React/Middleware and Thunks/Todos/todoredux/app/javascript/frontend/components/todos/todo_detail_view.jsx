import React from 'react';
import StepListContainer from '../step_list/step_list_container';
import { stepsByTodoId } from '../../reducers/selectors'

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const {todo, removeTodo} = this.props;

    return(
      <div>
        <p>Body: {todo.body}</p>
        <StepListContainer
          todoId={todo.id}
        />
        <button onClick={ () => removeTodo(todo) }>
          Remove Todo
        </button>
      </div>
    )
  }
}

export default TodoDetailView;

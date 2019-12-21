import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';

const todosReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      return action.todos.reduce((state, todo) => {
        state[todo.id] = todo;
        return state;
      }, {});

      return newState;
    case RECEIVE_TODO:
      let newState = Object.assign(state);
      newState[action.todo.id] = action.todo;

      return newState;
    default:
      return state;
  }
};

export default todosReducer;

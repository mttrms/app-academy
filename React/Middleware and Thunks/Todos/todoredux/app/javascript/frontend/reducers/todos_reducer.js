import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false,
    detail: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true,
    detail: true
  }
};

const todosReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS: {
      return action.todos.reduce((state, todo) => {
        state[todo.id] = todo;
        return state;
      }, {});

      return newState;
    }
    case RECEIVE_TODO: {
      const newState = Object.assign({}, state);
      newState[action.todo.id] = action.todo;

      return newState;
    }
    case REMOVE_TODO: {
      const newState = Object.assign({}, state);
      delete newState[action.todo.id]

      return newState;
    }
    default:
      return state;
  }
};

export default todosReducer;

import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';
import { allTodos } from './selectors';

window.allTodos = allTodos;

const rootReducer = combineReducers({
  todos: todosReducer
})

export default rootReducer;

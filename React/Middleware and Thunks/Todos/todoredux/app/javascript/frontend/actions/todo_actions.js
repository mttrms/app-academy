import * as TodoAPI from '../util/todo_api_util';
import { receiveErrors } from './error_actions';

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos: todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo: todo
});

export const removeTodo = (todo) => ({
  type: REMOVE_TODO,
  todo: todo
});

export const fetchTodos = () => dispatch => (
  TodoAPI.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = todo => dispatch => (
  TodoAPI.createTodo(todo)
  .then(
    response => {
      if (response.status === 200) {
        response.json().then(todo => dispatch(receiveTodo(todo)))
      } else {
        response.json().then(err => dispatch(receiveErrors(err)))
      }
    }
  )
);

window.createTodo = createTodo;

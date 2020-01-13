import * as TodoAPI from '../util/todo_api_util';
import { receiveErrors, clearErrors } from './error_actions';

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
        response.json().then(todo => {dispatch(receiveTodo(todo)); dispatch(clearErrors())})
      } else {
        response.json().then(err => dispatch(receiveErrors(err)))
        throw new Error;
      }
    }
  )
);

export const updateTodo = todo => dispatch => (
  TodoAPI.updateTodo(todo)
  .then(
    response => {
      if (response.status === 200) {
        response.json().then(todo => {dispatch(receiveTodo(todo)); dispatch(clearErrors())})
      } else {
        response.json().then(err => dispatch(receiveErrors(err)))
      }
    }
  )
);

export const deleteTodo = todo => dispatch => (
  TodoAPI.removeTodo(todo)
  .then(
    response => {
      if (response.status === 200) {
        dispatch(removeTodo(todo));
        dispatch(clearErrors());
      } else {
        response.json().then(err => dispatch(receiveErrors(err)))
      }
    }
  )
);

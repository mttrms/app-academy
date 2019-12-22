export const allTodos = (state) => {
  return Object.keys(state.todos).map((todoId) => {
    return state.todos[todoId];
  });
};


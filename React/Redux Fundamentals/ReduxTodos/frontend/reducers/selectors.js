export const allTodos = (state) => {
  return Object.keys(state.todos).map((todoId) => {
    return state.todos[todoId];
  });
};

export const stepsByTodoId = (state, todoId) => {
  const steps = [];

  Object.keys(state.steps).forEach((stepId) => {
    const step = state.steps[stepId];
    if (step.todoId === todoId) {
      steps.push(step);
    };
  });

  return steps;
};

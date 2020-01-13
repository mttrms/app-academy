export const fetchStepsByTodoId = todoId => {
  return fetch(`/api/todos/${todoId}/steps`)
    .then(response => response.json())
};

export const createStep = step => {
  return fetch(`/api/todos/${step.todo_id}/steps`,
    {
      method: 'POST',
      body: JSON.stringify(step),
      headers: {
        'Content-Type': 'application/json'
      }
    })
};

export const updateStep = step => {
  return fetch(`/api/steps/${step.id}`,
    {
      method: 'PATCH',
      body: JSON.stringify(step),
      headers: {
        'Content-Type': 'application/json'
      }
    })
};

export const removeStep = step => {
  return fetch(`/api/steps/${step.id}`,
    {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      }
    })
};

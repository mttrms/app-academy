export const fetchTodos = () => {
  return fetch('/api/todos')
    .then(response => response.json())
};

export const createTodo = (todo) => {
  return fetch('/api/todos',
    {
      method: 'POST',
      body: JSON.stringify(todo),
      headers: {
        'Content-Type': 'application/json'
      }
    })
};

export const updateTodo = todo => {
  const todoId = todo.id;
  return fetch(`/api/todos/${todoId}`,
    {
      method: 'PATCH',
      body: JSON.stringify(todo),
      headers: {
        'Content-Type': 'application/json'
      }
    })
};

export const removeTodo = todo => {
  const todoId = todo.id;
  return fetch(`/api/todos/${todoId}`,
    {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      }
    })
};

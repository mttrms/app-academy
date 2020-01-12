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

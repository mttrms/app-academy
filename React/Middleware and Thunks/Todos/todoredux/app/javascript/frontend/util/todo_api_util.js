export const fetchTodos = () => {
  return fetch('/api/todos')
    .then(response => response.json())
};

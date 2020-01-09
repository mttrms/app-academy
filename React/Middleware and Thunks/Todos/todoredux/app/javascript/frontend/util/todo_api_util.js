export const fetchTodos = () => {
  fetch('/api/todos')
    .then((response) => {
      return response.json();
    })
    .then((todos) => {
      console.log(todos);
    })
};

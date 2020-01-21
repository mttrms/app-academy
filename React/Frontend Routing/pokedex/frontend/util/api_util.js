export const fetchAllPokemon = () => (
  fetch('/api/pokemon/')
  .then(handleErrors)
  .then(response => response.json())
  .catch(error => console.log(error))
);

const handleErrors = response => {
  if (!response.ok){ 
    throw Error(response.statusText);
  }
  return response;
};

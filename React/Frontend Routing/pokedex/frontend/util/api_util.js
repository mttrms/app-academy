export const fetchAllPokemon = () => (
  fetch('/api/pokemon/')
  // .then(handleErrors)
  .then(response => response.json())
  .catch(error => console.log(error))
);

export const fetchSinglePokemon = pokemonId => (
  fetch(`/api/pokemon/${pokemonId}`)
  // .then(handleErrors)
  .then(response => response.json())
  .catch(error => console.log(error))
);

export const createNewPoke = pokemonData => {
  pokemonData.moves = Object.values(pokemonData.moves);

  return fetch('/api/pokemon/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(pokemonData)
  })
  .then(handleErrors)
  .then(response => response.json())
};

const handleErrors = response => {
  if (!response.ok){ 
    throw response;
  }
  return response;
};

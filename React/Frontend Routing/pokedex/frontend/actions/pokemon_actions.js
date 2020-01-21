import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = pokemon => ({
  type: RECEIVE_SINGLE_POKEMON,
  pokemon
});

export const requestAllPokemon = () => dispatch => (
  APIUtil.fetchAllPokemon()
  .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
  .catch(error => console.log(error))
);

export const requestSinglePokemon = pokemonId => dispatch => (
  APIUtil.fetchSinglePokemon(pokemonId)
  .then(pokemon => dispatch(receiveSinglePokemon(pokemon)))
  .catch(error => console.log(error))
);

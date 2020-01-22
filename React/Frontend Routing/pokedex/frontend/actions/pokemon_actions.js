import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = pokemonData => ({
  type: RECEIVE_SINGLE_POKEMON,
  pokemonData
});

export const requestAllPokemon = () => dispatch => {
  return APIUtil.fetchAllPokemon()
  .then(pokemon => {
    dispatch(receiveAllPokemon(pokemon));
    return pokemon;
  })
  .catch(error => console.log(error));
};

export const requestSinglePokemon = pokemonId => dispatch => {
  return APIUtil.fetchSinglePokemon(pokemonId)
  .then(pokemon => {
    dispatch(receiveSinglePokemon(pokemon));
    return pokemon;
  })
  .catch(error => console.log(error));
};

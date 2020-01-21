import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_SINGLE_POKEMON: {
      const newState = Object.assign({}, state);
      const poke = action.pokemonData.pokemon;
      newState[poke.id] = poke;

      return newState;
    }
    default:
      return state;
  }
};

export default pokemonReducer;

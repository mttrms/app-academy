import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      const newState = Object.assign({}, state, action.pokemonData.items);
      // Alternate (worse) method that accomplishes what last arg above does:
      // const items = Object.values(action.pokemonData.items);
      // items.forEach(item => newState[item.id] = item);

      return newState;
    default:
      return state;
  }
};

export default itemsReducer;

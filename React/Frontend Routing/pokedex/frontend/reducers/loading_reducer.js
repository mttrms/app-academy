import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_SINGLE_POKEMON,
  START_LOADING_ALL_POKEMON,
  START_LOADING_SINGLE_POKEMON 
} from '../actions/pokemon_actions';

const initialState = {
  indexLoading: false,
  detailLoading: false
};

const loadingReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return Object.assign({}, state, { indexLoading: false });
    case RECEIVE_SINGLE_POKEMON:
      return Object.assign({}, state, { detailLoading: false });
    case START_LOADING_ALL_POKEMON:
      return Object.assign({}, state, { indexLoading: true });
    case START_LOADING_SINGLE_POKEMON:
      return Object.assign({}, state, { detailLoading: true });
    default: 
      return state;
  }
};

export default loadingReducer;

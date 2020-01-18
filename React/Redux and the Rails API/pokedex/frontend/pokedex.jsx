import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store'

// TODO: Remove
import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon } from './actions/pokemon_actions';
import pokemonReducer from './reducers/pokemon_reducer';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);

  // TODO: Remove
  window.getState = store.getState;
  window.dispatch = store.dispatch;
});

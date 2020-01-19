import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store'
import Root from './components/root';

// TODO: Remove
import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import pokemonReducer from './reducers/pokemon_reducer';
import { selectAllPokemon } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(
    <Root store={store} />,
    rootEl
  );

  // TODO: Remove
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
});

import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import { login } from './actions/session_actions';
import { createBench } from './util/bench_api_util';

import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  let store;
  if (window.currentUser) {
    const preloadedState = {
      entities: {
        users: { [window.currentUser.id]: window.currentUser }
      },
      session: { id: window.currentUser.id }
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }

  const root = document.getElementById("root");
  ReactDOM.render(<Root store={ store } />, root);

  // TODO: Remove when done building app
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.login = login;
  window.createBench = createBench;
});

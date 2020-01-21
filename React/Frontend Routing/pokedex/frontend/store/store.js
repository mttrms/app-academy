import { createStore, applyMiddleware } from 'redux';
import { logger } from 'redux-logger';
import thunk from '../middleware/thunk';
import rootReducer from '../reducers/root_reducer';

export const configureStore = () => (
  createStore(rootReducer, applyMiddleware(thunk, logger))
);

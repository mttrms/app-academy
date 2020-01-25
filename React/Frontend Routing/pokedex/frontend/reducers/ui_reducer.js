import { combineReducers } from 'redux';
import errorsReducer from './errors_reducer';

export default combineReducers({
  errors: errorsReducer,
});

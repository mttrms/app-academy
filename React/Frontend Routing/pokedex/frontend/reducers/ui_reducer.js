import { combineReducers } from 'redux';
import errorsReducer from './errors_reducer';
import loadingReducer from './loading_reducer';

export default combineReducers({
  errors: errorsReducer,
  loading: loadingReducer
});

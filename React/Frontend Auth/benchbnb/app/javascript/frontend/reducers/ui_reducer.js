import { combineReducers } from 'redux';

import filtersReducer from './filters_reducer';

export default combineReducers({
  filters: filtersReducer
});

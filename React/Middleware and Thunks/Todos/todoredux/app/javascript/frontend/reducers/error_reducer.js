import { RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/error_actions';
const errorsReducer = (state = [], action) => {
  switch(action.type) {
    case RECEIVE_ERRORS:
      return {...state, messages: action.errors};
    case CLEAR_ERRORS:
      return {...state, messages: []};
    default:
      return state;
  }
}

export default errorsReducer;

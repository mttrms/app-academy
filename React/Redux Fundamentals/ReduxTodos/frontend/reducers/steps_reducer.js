import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from '../actions/step_actions';

const initialState = {
  1: {
    id: 1,
    title: 'first step title',
    body: 'first step body',
    done: false,
    todoId: 1
  }
}

const stepsReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_STEPS: {
      const newState = Object.assign({}, state);
      action.steps.forEach((step) => {
        newState[step.id] = step;
      })

      return newState;
    }
    case RECEIVE_STEP: {
      const newState = Object.assign({}, state);
      newState[action.step.id] = action.step;

      return newState;
    }
    case REMOVE_STEP: {
      const newState = Object.assign({}, state);
      delete newState[action.step.id];

      return newState;
    }
    default:
      return state;
  }
};

export default stepsReducer;


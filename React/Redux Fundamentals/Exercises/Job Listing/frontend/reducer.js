const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  const newState = {};

  switch(action.type) {
    case 'SWITCH_LOCATION':
      newState.city = action.city;
      newState.jobs = [];
      return newState;
    default:
      return state;
  }
};

export default reducer;

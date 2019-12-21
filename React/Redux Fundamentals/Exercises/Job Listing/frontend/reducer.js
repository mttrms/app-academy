const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  const newState = Object.assign(state);

  switch(action.type) {
    case 'SWITCH_LOCATION':
      newState[city] = action.city;
      return newState;
    default:
      return newState;
  }
};

export default reducer;

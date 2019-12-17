class Store {
  constructor(rootReducer) {
    this.rootReducer = rootReducer;
    this.globalState = {};
  }

  getState() {
    return Object.assign(this.globalState);
  }

  dispatch(action) {
    const rootReducer = this.rootReducer;
    const prevState = this.globalState;
    const nextState = rootReducer(prevState, action);

    this.globalState = nextState;
  }
}

const combineReducers = (reducers) => {
  return (prevState, action) => {
    const newState = {};

    Object.keys(reducers).forEach(key => {
      newState[key] = reducers[key](prevState[key], action);
    })

    return newState;
  }
}


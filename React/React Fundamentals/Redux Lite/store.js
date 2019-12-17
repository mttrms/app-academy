class Store {
  constructor(rootReducer) {
    this.rootReducer = rootReducer;
    this.state = rootReducer({});
  }

  getState() {
    return Object.assign(this.state);
  }

  dispatch(action) {
    this.state = this.rootReducer(this.state, action);
  }
}

const combineReducers = (reducers) => {
  return (prevState, action) => {
    const newState = {};

    Object.keys(reducers).forEach(key => {
      if (!action) {
        const args = [ , { type: "__initialize" }];
        newState[key] = reducers[key](...args);
      } else {
        newState[key] = reducers[key](prevState[key], action);
      }
    })

    return newState;
  }
}


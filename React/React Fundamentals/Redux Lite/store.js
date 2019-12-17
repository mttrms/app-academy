class Store {
  constructor(rootReducer) {
    this.rootReducer = rootReducer;
    this.state = rootReducer({});
    this.subscriptions = [];
  }

  getState() {
    return Object.assign(this.state);
  }

  dispatch(action) {
    this.state = this.rootReducer(this.state, action, this.subscriptions);
  }

  subscribe(cb) {
    this.subscriptions.push(cb);
  }
}

const combineReducers = (reducers) => {
  return (prevState, action, subscriptions = []) => {
    const newState = {};
    let stateChanged = false;

    Object.keys(reducers).forEach(key => {
      if (!action) {
        const args = [ , { type: "__initialize" }];
        newState[key] = reducers[key](...args);
      } else {
        newState[key] = reducers[key](prevState[key], action);
      }

      if (prevState[key] !== newState[key]) {
        stateChanged = true;
      }
    })

    if (stateChanged) {
      subscriptions.forEach((cb) => {
        cb(newState);
      })
    }

    return newState;
  }
}


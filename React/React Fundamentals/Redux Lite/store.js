class Store {
  constructor(rootReducer) {
    this.rootReducer = rootReducer;
    this.globalState = {};
  }

  getState() {
    return Object.assign(this.globalState);
  }
}

export default Store;

const combineReducers = (reducers) => (
  (prevState = null, action) => {
    const keys = Object.keys(prevState);
    const newState = Object.assign(prevState);

    for (let i = 0; i < keys.length; i++) {
      let key = keys[i]

      if (reducers[key]) {
        let reducer = reducers[key];
        let value = reducer(prevState, action);

        if (value !== prevState) {
          newState[key] = value;
        }
      }
    }

    return newState;
  }
)

const myNoiseReducer = (prevState = "peace and quiet", action) => {
  switch(action.type) {
    case "noisy action":
      return action.noise;
    default:
      return prevState;
  }
};

const myNoisyAction = {
  type: "noisy action",
  noise: "Car alarm"
};

const myInconsequentialAction = {
  type: "a type no one cares about",
  data: {
    thisThing: "will not get used anyway"
  }
};

const myInitialState = {
  noise: "peace and quiet"
};

const myRootReducer = combineReducers({
  noise: myNoiseReducer,
});

let newState = myRootReducer(myInitialState, myInconsequentialAction);
console.log(newState);
// => { noise: "peace and quiet" }

newState = myRootReducer(newState, myNoisyAction)
console.log(newState);
// => { noise: "Car alarm" }

console.log(myRootReducer(newState, myInconsequentialAction));

// => { noise: "Car alarm" }

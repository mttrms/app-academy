const combineReducers = (reducers) => (
  (prevState, action) => {
    const newState = {};

    Object.keys(reducers).forEach(key => {
      newState[key] = reducers[key](prevState[key], action);
    })

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

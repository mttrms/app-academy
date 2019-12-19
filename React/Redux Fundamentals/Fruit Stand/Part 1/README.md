# Fruit Stand App
## Phase 01 - Redux Only

This is simple **Redux** application with a Redux `store`, a  `reducer` and actions.

**NB**: There are no React components in this phase.

[Live Demo][live-demo]

---

Let's start by looking at the code you just walked through in the first half of
our Redux [store reading][store-reading].

+ Notable libraries used - `redux`.
+ Actions are defined in [`frontend/actions.js`][actions-code].
+ The app's `reducer` (i.e. reducing function) is defined in [`frontend/reducer.js`][reducer-code].
+ The app's Redux store is instantiated in [`frontend/store.js`][store-code].
  + The Redux store constructor `createStore` is imported from `redux`.
  + The app's `reducer` is imported from `frontend/reducer.js`.

Cool, now let's interact with the app. The app's `store` and actions `addOrange`
and `addApple` are defined on the `window`.

+ Open up Dev Tools from the [live demo][live-demo].
+ Try dispatching actions to see how they change the app's state.

For example,
```
store.getState();
store.dispatch(addOrange);
store.getState();
store.dispatch(addApple);
store.getState();
```

+ Create new actions on the `window`.
+ Try dispatching them. How do they change the app's state?

For example,
```
const addLychee = { type: 'ADD_FRUIT', fruit: 'lychee' };
store.dispatch(addLychee);
store.getState();
```

In the [next phase][fruit-stand-02], we will add React components to render the
fruit stored in the app's state - creating our first React/Redux app.

---

If you want to run the source code yourself, follow these instructions:
  1. Download [zip][zip].
  1. Unzip and `cd` to the app's root directory.
  1. Run `npm install` to install the Redux npm packages.
  1. The `postinstall` script in the `package.json` take care of running `webpack`,
     but run `npm run webpack` if you plan to make changes to the code
  1. `open index.html` to see the app in the browser.
  1. Open Dev Tools to see the app's Redux store in action.
    + Available for testing on the `window` are the app's Redux `store`, and actions `addOrange` and `addApple`.


[zip]: ./fruit_stand_01.zip
[live-demo]: http://appacademy.github.io/curriculum/react/fruit_stand_01/index.html
[store-reading]: ../../../readings/store.md
[store-code]: ./frontend/store.js
[reducer-code]: ./frontend/reducer.js
[actions-code]: ./frontend/actions.js
[fruit-stand-02]: ../fruit_stand_02

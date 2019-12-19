function connect(mapStateToProps, mapDispatchToProps) {
  // Returns a function that takes your component as an argument
  return function(YourAwesomeComponent) {
    // Leaving out some details, but basically we have access to
    // the store via the context set up by the Provider

    // Your mapStateToProps function gets called with the store's state
    const stateProps = mapStateToProps(store.getState());
    // Your mapDispatchToProps function gets called with the store's dispatch function
    const dispatchProps = mapDispatchToProps(store.dispatch);

    // Returns a React component that renders your component with all the props
    return function Connect(moreProps) {
      const props = Object.assign(stateProps, dispatchProps, moreProps);

      return <YourAwesomeComponent {...props} />;
    };
  };
}


import React from 'react';
import { Route, Switch } from 'react-router-dom';
import { AuthRoute, ProtectedRoute } from '../util/route_util';

import GreetingContainer from './greeting/greeting_container';
import LoginFormContainer from './session_form/login_form_container';
import SignupFormContainer from './session_form/signup_form_container';
import SearchContainer from './benches/search_container';
import BenchFormContainer from './benches/bench_form_container';
import BenchShowContainer from './benches/bench_show_container';

const App = () => (
  <div>
    <header>
      <h1>BenchBnB</h1>
      <GreetingContainer />
    </header>

    <Switch>
      <AuthRoute path='/login' component={LoginFormContainer} />
      <AuthRoute path='/signup' component={SignupFormContainer} />
      <Route exact path='/' component={SearchContainer} />
      <ProtectedRoute exact path='/benches/new' component={BenchFormContainer} />
      <Route path='/benches/:benchId' component={BenchShowContainer} />
    </Switch>
  </div>
);

export default App;

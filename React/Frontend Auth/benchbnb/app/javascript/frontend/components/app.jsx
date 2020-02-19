import React from 'react';
import { Route } from 'react-router-dom';
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

    <AuthRoute path='/login' component={LoginFormContainer} />
    <AuthRoute path='/signup' component={SignupFormContainer} />
    <Route exact path='/' component={SearchContainer} />
    <Route path='/benches/:benchId' component={BenchShowContainer} />
    <ProtectedRoute exact path='/benches/new' component={BenchFormContainer} />
  </div>
);

export default App;

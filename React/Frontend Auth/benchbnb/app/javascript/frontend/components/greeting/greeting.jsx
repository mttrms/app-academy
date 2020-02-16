import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ currentUser, logout }) => {
  const personalGreeting = () => (
    <div>
      <h2>Hi, { currentUser.username }!</h2>
      <button onClick = {logout}>Logout</button>
    </div>
  );

  const authLinks = () => (
    <div>
      <Link to="/login">Login</Link>
      <Link to="/signup">Signup</Link>
    </div>
  );

  return currentUser ? personalGreeting() : authLinks();
};

export default Greeting;

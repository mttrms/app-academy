import React from 'react';
import PropTypes from 'prop-types';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return e => this.setState({
      [field]: e.currentTarget.value
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  renderErrors() {
    return(
      <ul>
        {this.props.errors.map((error, i) => (
          <li key={`error-${i}`}>
            { error }
          </li>
        ))}
      </ul>
    );
  }

  render() {
    return (
      <div>
        <p>Welcome to BenchBnB. Please { this.props.formType } or { this.props.navLink }.</p>
        { this.renderErrors() }
        <form onSubmit={this.handleSubmit}>
          <label>Username:
            <input
              type="text"
              value={this.state.username}
              onChange={this.update('username')}
            />
          </label>
          <br />
          <label>Password:
            <input
              type="password"
              value={this.state.password}
              onChange={this.update('password')}
            />
          </label>
          <br />
          <input type="submit" value={this.props.formType} />
        </form>
      </div>
    )
  }
}

SessionForm.propTypes = {
  errors: PropTypes.array.isRequired,
  processForm: PropTypes.func.isRequired,
  formType: PropTypes.string.isRequired,
  navLink: PropTypes.element.isRequired
}

export default SessionForm;

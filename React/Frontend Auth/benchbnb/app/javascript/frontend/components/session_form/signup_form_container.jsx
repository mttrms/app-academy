import { connect } from 'react-redux';

import { signup } from '../../actions_session_actions';
import SessionForm from './session_form';

const mapStateToProps = state => ({
  errors: state.errors.session,
  formType: 'signup'
});

const mapDispatchToProps = dispatch => ({
  processForm: user => dispatch(signup(user))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);

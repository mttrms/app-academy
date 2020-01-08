import { connect } from 'react-redux';
import StepList from './step_list';
import { stepsByTodoId } from '../../reducers/selectors';
import { receiveStep } from '../../actions/step_actions';

const mapDispatchToProps = dispatch => ({
  receiveStep: step => dispatch(receiveStep(step))
});

const mapStateToProps = (state, { todoId }) => ({
  steps: stepsByTodoId(state, todoId),
  todoId
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);

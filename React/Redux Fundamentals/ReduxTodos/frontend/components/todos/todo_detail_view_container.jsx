import { connect } from 'react-redux';
import TodoDetailView from 'todo-detail-view';
import { removeTodo } from '../../actions/todo_actions';
import { receiveSteps } from '../../actions/step_actions';

const mapDispatchToProps = dispatch => ({
  removeTodo: todo => dispatch(removeTodo(todo)),
  receiveSteps: steps => dispatch(receiveSteps(steps))
});

export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);

import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';
import { deleteTodo } from '../../actions/todo_actions';
import { fetchSteps } from '../../actions/step_actions';

const mapDispatchToProps = (dispatch, { todo }) => ({
  fetchSteps: () => dispatch(fetchSteps(todo.id)),
  deleteTodo: todo => dispatch(deleteTodo(todo))
});

export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);

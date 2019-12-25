import { connect } from 'react-redux';
import TodoDetailView from 'todo-detail-view';

const mapDispatchToProps = dispatch => ({
  removeTodo: todo => dispatch(removeTodo(todo))
});

export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);

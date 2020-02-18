import { connect } from 'react-redux';

import { createBench } from '../../actions/bench_actions';
import BenchForm from './bench_form';

const mapDispatchToProps = dispatch => ({
  createBench: bench => dispatch(createBench(bench))
});

export default connect(
  null,
  mapDispatchToProps
)(BenchForm);

import { connect } from 'react-redux';

import Search from './search';
import { fetchBenches } from '../../actions/bench_actions';
import { updateBounds } from '../../actions/filter_actions';

const mapStateToProps = state => ({
  benches: Object.keys(state.entities.benches).map(key => state.entities.benches[key])
})

const mapDispatchToProps = dispatch => ({
  fetchBenches: () => dispatch(fetchBenches()),
  updateBounds: bounds => dispatch(updateBounds(bounds))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);

import { connect } from 'react-redux';

import PokemonIndex from './pokemon_index';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import { selectAllPokemon } from '../../reducers/selectors';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state),
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon()),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);

import { connect } from 'react-redux';
import PokemonIndex from './pokemon_index';
import { requestAllPokemon } from '../../actions/pokemon_actions';

const mapStateToProps = state => ({
  pokemon: state.entities.pokemon,
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: dispatch(requestAllPokemon),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);

import { connect } from 'react-redux';
import { createPokemon } from '../../actions/pokemon_actions';
import PokemonForm from './pokemon_form';

const mapDispatchToProps = dispatch => ({
  createPokemon: pokemonData => dispatch(createPokemon(pokemonData)),
});

export default connect(
  null,
  mapDispatchToProps
)(PokemonForm);

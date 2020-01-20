import { connect } from 'react-redux';

const mapStateToProps = state => ({
  pokemon: state.entities.pokemon,
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: dispatch(requestAllPokemon),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
);

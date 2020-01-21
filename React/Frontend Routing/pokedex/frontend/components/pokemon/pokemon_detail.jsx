import React from 'react';
import PropTypes from 'prop-types';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const pokemonId = this.props.match.params.pokemonId;
    this.props.requestSinglePokemon(pokemonId);
  };

  render() {
    return (
      <p>Poke</p>
    )
  };
}

export default PokemonDetail;

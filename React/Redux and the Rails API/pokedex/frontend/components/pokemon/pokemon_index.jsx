import React from 'react';
import PropTypes from 'prop-types';
import PokemonIndexContainer from './pokemon_index_container';

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <p>I am a poke</p>
    )
  }
};

export default PokemonIndex;

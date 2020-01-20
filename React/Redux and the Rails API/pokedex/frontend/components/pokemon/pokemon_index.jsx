import React from 'react';
import PropTypes from 'prop-types';
import PokemonIndexContainer from './pokemon_index_container';

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  pokeDetails(pokemon) {
    return (
      <li
        key={pokemon.id}
        className='pokemon'
      >
        <p>{pokemon.name}</p>
        <img src={pokemon.image_url} />
      </li>
    )
  };

  render() {
    const { pokemon } = this.props;
    return (
      <ul>{ pokemon.map(poke => this.pokeDetails(poke)) }</ul>
    )
  }
};

PokemonIndex.propTypes = {
  requestAllPokemon: PropTypes.func.isRequired,
  pokemon: PropTypes.array.isRequired
}

export default PokemonIndex;

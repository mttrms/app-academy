import React from 'react';
import PropTypes from 'prop-types';
import PokemonIndexContainer from './pokemon_index_container';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;
    const pokemonItems = pokemon.map(poke => (
      <PokemonIndexItem key={poke.id} pokemon={poke} />
    ));

    return (
      <section className="pokedex">
        <ul>{pokemonItems}</ul>
      </section>
    )
  }
};

PokemonIndex.propTypes = {
  requestAllPokemon: PropTypes.func.isRequired,
  pokemon: PropTypes.array.isRequired
}

export default PokemonIndex;

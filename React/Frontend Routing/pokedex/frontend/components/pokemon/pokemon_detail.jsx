import React from 'react';
import PropTypes from 'prop-types';

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  };

  componentDidUpdate(prevProps) {
    if (prevProps.match.params.pokemonId != this.props.match.params.pokemonId) {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId);
    }
  };

  render() {
    const {pokemon, items} = this.props;

    if (!pokemon) return null;

    const pokemonItems = items.map(item => <li key={item.id}>{item.name}</li>);

    return (
      <section className="pokemon-detail">
        <h2>{pokemon.name}</h2>
        <img src={pokemon.image_url} />
        <h3>Stats</h3>
        <ul>
          <li>Type: {pokemon.poke_type}</li>
          <li>Attack: {pokemon.attack}</li>
          <li>Defense: {pokemon.defense}</li>
          <li>Moves: {pokemon.moves.join(', ')}</li>
        </ul>
        <h3>Items</h3>
        <ul>
          {pokemonItems}
        </ul>
      </section>
    )
  };
}

export default PokemonDetail;

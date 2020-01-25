import React from 'react';
import { Route, Link } from 'react-router-dom';
import PropTypes from 'prop-types';
import Item from '../items/item';
import ItemDetailContainer from '../items/item_detail_container';
import Loader from '../loader';

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  };

  componentDidUpdate(prevProps) {
    if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId) {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId);
    }
  };

  render() {
    const {pokemon, items, loading} = this.props;
    if (loading) return <Loader />
    if (!pokemon) return null;

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
        <section className="pokemon-items">
          { items.length > 0 ? <h3>Items</h3> : '' }
          <ul>
            {items.map(item => <Item key={item.id} item={item} />)}
          </ul>
          <Route
            path="/pokemon/:pokemonId/item/:itemId"
            component={ItemDetailContainer}
          />
        </section>
      </section>
    )
  };
}

export default PokemonDetail;

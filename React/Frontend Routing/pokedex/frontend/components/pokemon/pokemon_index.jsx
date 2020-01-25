import React from 'react';
import { Route } from 'react-router-dom';
import PropTypes from 'prop-types';
import PokemonIndexContainer from './pokemon_index_container';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonIndexItem from './pokemon_index_item';
import PokemonFormContainer from './pokemon_form_container';
import Loader from '../loader';

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon, loading } = this.props;

    if (loading) return <Loader />

    const pokemonItems = pokemon.map(poke => (
      <PokemonIndexItem key={poke.id} pokemon={poke} />
    ));

    return (
      <section className="pokedex">
        <ul className="pokemon-list">{pokemonItems}</ul>
        <section className="pokemon-view">
          <Route
            path="/"
            exact
            component={PokemonFormContainer}
          />
          <Route
            path="/pokemon/:pokemonId"
            component={PokemonDetailContainer}
          />
        </section>
      </section>
    )
  }
};

PokemonIndex.propTypes = {
  requestAllPokemon: PropTypes.func.isRequired,
  pokemon: PropTypes.array.isRequired
}

export default PokemonIndex;

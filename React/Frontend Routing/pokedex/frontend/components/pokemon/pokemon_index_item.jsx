import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';

const PokemonIndexItem = ({pokemon}) => (
  <li className='pokemon'>
    <Link to={`/pokemon/${pokemon.id}`}>
      <img src={pokemon.image_url} />
      <p>{pokemon.name}</p>
    </Link>
  </li>
);

PokemonIndexItem.propTypes = {
  pokemon: PropTypes.object,
};

export default PokemonIndexItem;

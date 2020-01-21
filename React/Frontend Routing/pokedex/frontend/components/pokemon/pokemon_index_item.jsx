import React from 'react';
import PropTypes from 'prop-types';

const PokemonIndexItem = ({pokemon}) => (
  <li className='pokemon'>
    <p>{pokemon.name}</p>
    <img src={pokemon.image_url} />
  </li>
);

PokemonIndexItem.propTypes = {
  pokemon: PropTypes.object,
};

export default PokemonIndexItem;

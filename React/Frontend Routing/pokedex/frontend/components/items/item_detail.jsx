import React from 'react';

const ItemDetail = props => {
  const {item} = props;

  return (
    <section className="pokemon-item-details">
      <h3>{item.name}</h3>
      <ul>
        <li>Price: {item.price}</li>
        <li>Happiness: {item.happiness}</li>
      </ul>
    </section>
  )
};

export default ItemDetail;

import React from 'react';
import { Link } from 'react-router-dom';

const Item = ({item}) => (
  <li>
    <img src={item.image_url} />
    <p>{item.name}</p>
  </li>
);

export default Item;

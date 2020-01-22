import React from 'react';
import { Link } from 'react-router-dom';
import ItemDetailContainer from './item_detail_container';

const Item = ({item}) => (
  <li>
    <img src={item.image_url} />
    <p>{item.name}</p>
    <ItemDetailContainer />
  </li>
);

export default Item;

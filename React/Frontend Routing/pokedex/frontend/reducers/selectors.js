export const selectAllPokemon = state => (
  Object.values(state.entities.pokemon)
);

export const selectPokemonItems = (state, pokemon) => {
  return pokemon ? pokemon.item_ids.map(itemId => state.entities.items[itemId]) : [];
};

export const selectPokemonItem = (state, itemId) => {
  return itemId ? state.entities.items[itemId] : {};
};

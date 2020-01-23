import React from 'react';
import PokemonFormContainer from './pokemon_form_container';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      attack: '',
      defense: '',
      poke_type: '',
      moves: [],
      image_url: ''
    };

    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  };

  handleInput(e) {
    console.log(this.state);
    const property = e.target.name;
    const value = e.target.value;

    return this.setState({ [property]: e.target.value });
  };

  handleSubmit(e) {
    e.preventDefault();
    this.props.createPokemon(this.state);
  };

  render() {
    return (
      <form className="pokemon-form" onSubmit={this.handleSubmit}>
        <label>Name:
          <input
            id="pokemonName"
            name="name"
            value={this.state.name}
            type="text"
            onChange={this.handleInput}
          />
        </label>
        <label>Attack:
          <input
            id="pokemonAttack"
            name="attack"
            value={this.state.attack}
            type="number"
            onChange={this.handleInput}
          />
        </label>
        <label>Defense:
          <input
            id="pokemonDefense"
            name="defense"
            value={this.state.defense}
            type="number"
            onChange={this.handleInput}
          />
        </label>
        <label>Pokemon Type:
          <select
            id="pokemonType"
            name="poke_type"
            onChange={this.handleInput}
          >
            <option value='fire'>fire</option>
            <option value='electric'>electric</option>
            <option value='normal'>normal</option>
            <option value='ghost'>ghost</option>
            <option value='psychic'>psychic</option>
            <option value='water'>water</option>
            <option value='bug'>bug</option>
            <option value='dragon'>dragon</option>
            <option value='grass'>grass</option>
            <option value='fighting'>fighting</option>
            <option value='ice'>ice</option>
            <option value='flying'>flying</option>
            <option value='poison'>poison</option>
            <option value='ground'>ground</option>
            <option value='rock'>rock</option>
            <option value='steel'>steel</option>
          </select>
        </label>
        <label>Image URL:
          <input
            id="pokemonImageUrl"
            name="image_url"
            value={this.state.image_url}
            type="text"
            onChange={this.handleInput}
          />
        </label>
        <input type="Submit" defaultValue="Add Pokemon" />
      </form>
    )
  };
};

export default PokemonForm;

import React from 'react';
import { withRouter } from 'react-router-dom';
import PokemonFormContainer from './pokemon_form_container';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      attack: '',
      defense: '',
      poke_type: '',
      moves: {},
      image_url: '1.svg'
    };

    this.handleInput = this.handleInput.bind(this);
    this.handleMoves = this.handleMoves.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.errors = this.errors.bind(this);
  };

  handleInput(e) {
    const property = e.target.name;

    return this.setState({ [property]: e.target.value });
  };

  handleMoves(e) {
    const move = e.target.name;
    const value = e.target.value;

    return this.setState({
      moves: Object.assign({}, this.state.moves, {
        [move]: value
      })
    });
  };

  handleSubmit(e) {
    e.preventDefault();
    this.props.createPokemon(this.state)
      .then(pokemonData => {
        const newPokemon = pokemonData.pokemon;
        this.props.history.push(`/pokemon/${newPokemon.id}`);
      });
  };

  errors() {
    if (this.props.errors) {
      return this.props.errors.map(error => {
        return (
          <li className="error" key={error}>{error}</li>
        )
      })
    }
  };

  render() {
    return (
      <form className="pokemon-form" onSubmit={this.handleSubmit}>
        <h2>Add a pokemon</h2>
        <ul>{ this.errors() }</ul>
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
            <option defaultValue=''>--- Select a Poke Type ---</option>
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
        <label>Image URL (1-151.svg):
          <input
            id="pokemonImageUrl"
            name="image_url"
            value={this.state.image_url}
            type="text"
            onChange={this.handleInput}
          />
        </label>
        <label>Move 1:
          <input
            id="pokemonMove1"
            name="move1"
            value={this.state.moves.move1 || ''}
            type="text"
            onChange={this.handleMoves}
          />
        </label>
        <label>Move 2:
          <input
            id="pokemonMove2"
            name="move2"
            value={this.state.moves.move2 || ''}
            type="text"
            onChange={this.handleMoves}
          />
        </label>
        <input type="Submit" defaultValue="Add Pokemon" />
      </form>
    )
  };
};

export default withRouter(PokemonForm);

import React from 'react';
import PropTypes from 'prop-types';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {searchTerm: ''};
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    const searchTerm = e.target.value;
    this.setState({searchTerm});
  }

  handleSubmit(e) {
    e.preventDefault();
    const searchTerm = this.state.searchTerm;
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
    return (
      <div>
      <form onSubmit={ this.handleSubmit }>
        <label htmlFor="searchterm">Find gifs:</label>
        <input
          className="input"
          value={ this.state.searchTerm }
          onChange={ this.handleInput }
          type="text"
          id="searchterm"
        />
        <button>Search Giphy</button>
      </form>
        <GiphysIndex
          giphys={this.props.giphys}
        />
      </div>
    )
  }
}

GiphysSearch.propTypes = {
  fetchSearchGiphys: PropTypes.func,
  giphys: PropTypes.array
}

export default GiphysSearch;

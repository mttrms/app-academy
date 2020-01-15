import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {searchTerm: ''};
  }

  render() {
    return (
      <form>
        <label htmlFor="searchterm">Find gifs:</label>
        <input type="text" id="searchterm" />
        <button>Search Giphy</button>
      </form>
    )
  }
}

export default GiphysSearch;

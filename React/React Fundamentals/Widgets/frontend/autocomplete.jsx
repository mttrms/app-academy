import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.names = this.props.names;
    this.state = {inputVal: ''}
    this.handleInput = this.handleInput.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleInput(e) {
    const inputVal = e.currentTarget.value;
    this.setState({inputVal})
  }

  handleClick(e) {
    if (e.target.tagName.toLowerCase() === 'li') {
      const name = e.target.innerHTML;
      this.setState({inputVal: name})
    }
  }

  render () {
    const inputVal = this.state.inputVal;

    const names = this.names.filter((name) => {
      return name.toLowerCase().includes(inputVal.toLowerCase());
    }).map((name, idx) => {
      return <li key={idx}>{name}</li>;
    })


    return(
      <div className="autocomplete">
        <h1>Autocomplete</h1>
        <input type="text" onChange={this.handleInput} value={this.state.inputVal}/>
        <ul onClick={this.handleClick}>{names}</ul>
      </div>
    )
  }
}

export default Autocomplete;

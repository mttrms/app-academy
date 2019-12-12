import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      num1: '',
      num2: '',
      result: 0
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    this.setState({ num1: e.target.value });
  }

  setNum2(e) {
    this.setState({ num2: e.target.value  });
  }

  add(e) {
    e.preventDefault();
    const num1 = Number(this.state.num1);
    const num2 = Number(this.state.num2)

    this.setState({ result: num1 + num2 });
  }

  subtract(e) {
    e.preventDefault();
    const num1 = Number(this.state.num1);
    const num2 = Number(this.state.num2)

    this.setState({ result: num1 - num2 });
  }

  divide(e) {
    e.preventDefault();
    const num1 = Number(this.state.num1);
    const num2 = Number(this.state.num2)

    this.setState({ result: num1 / num2 });
  }

  multiply(e) {
    e.preventDefault();
    const num1 = Number(this.state.num1);
    const num2 = Number(this.state.num2)

    this.setState({ result: num1 * num2 });
  }

  clear(e) {
    e.preventDefault();
    this.setState({ result: 0, num1: '', num2: '' })
  }

  render() {
     const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{ result }</h1>
        <label>Num 1</label>
        <input onChange={this.setNum1} value={num1}></input>

        <label>Num 2</label>
        <input onChange={this.setNum2} value={num2}></input>

        <br />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>

        <br />
        <button onClick={this.clear}>Clear</button>
      </div>
    );
  }
}

export default Calculator;

import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date() }
    this.tick = this.tick.bind(this);
  }

  tick() {
    const { time } = this.state;
    time.setSeconds(time.getSeconds() + 1);
    this.setState({ time });
  }

  componentDidMount() {
    this.handle = window.setInterval(this.tick, 1000)
  }

  componentWillUnmount() {
    clearInterval(this.handle);
  }

  render() {
    const { time } = this.state;

    return(
    <div className="clock">
      <h1>React Clock<span className="emoji" role="img" aria-label="clock">🕰️</span></h1>
      <span>{ `${time.getMonth() + 1}/${time.getDate()}/${time.getFullYear()} ` }</span>
      <span>{ `${time.getHours()}:${time.getMinutes()}:${time.getSeconds()}` }</span>
    </div>
    )
  }
}

export default Clock;

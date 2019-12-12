import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date() }
    this.tick = this.tick.bind(this);
  }

  tick() {
    const time = this.state.time;
    time.setSeconds(time.getSeconds() + 1);
    this.setState({ time })
  }

  componentDidMount() {
    window.setInterval(this.tick, 1000)
  }

  render() {
    return(
    <div>
      <h1>Clock</h1>
    </div>
    )
  }
}

export default Clock;

import React from 'react';

class BenchIndex extends React.Component {
  componentDidMount() {
    this.props.fetchBenches()
  }

  render() {
    const { benches } = this.props;

    const benchItems = Object.keys(benches).map(id => {
      const bench = benches[id];

      return (
        <div key={id} className="bench-item">
          <p>Description: { bench.description }</p>
          <p>Lat: { bench.lat }</p>
          <p>Lng: { bench.lng }</p>
        </div>)
    });

    return benchItems;
  }
}

export default BenchIndex;

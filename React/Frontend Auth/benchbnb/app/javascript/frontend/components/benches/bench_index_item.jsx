import React from 'react';

class BenchIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { bench } = this.props;

    return (
      <div className="bench-item">
        <p>Description: { bench.description }</p>
        <p>Lat: { bench.lat }</p>
        <p>Lng: { bench.lng }</p>
      </div>
    )
  }
}

export default BenchIndexItem;

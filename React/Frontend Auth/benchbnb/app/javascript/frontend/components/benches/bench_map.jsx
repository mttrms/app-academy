import React from 'react';

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
    this.mapRef = React.createRef()
  }

  render() {
    return <div id="map-container" ref={this.mapRef}></div>
  }
}

export default BenchMap;

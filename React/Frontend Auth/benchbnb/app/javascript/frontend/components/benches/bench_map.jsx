import React from 'react';

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const mapOptions = {
      center: { lat: 40.720135, lng: -74.042943 },
      zoom: 15 
    };

    this.map = new google.maps.Map(this.mapNode, mapOptions);
  }

  render() {
    return <div id="map-container" ref={ map => this.mapNode = map }></div>
  }
}

export default BenchMap;

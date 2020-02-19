import React from 'react';
import ReactDOM from 'react-dom';
import { withRouter } from 'react-router-dom';

import MarkerManager from './marker_manager';

const mapOptions = {
  center: { lat: 40.720135, lng: -74.042943 },
  zoom: 15 
};

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map, this.handleMarkerClick.bind(this));
    if (this.props.singleBench) {
      this.props.fetchBench(this.props.benchId);
    } else {
      this.registerListeners();
      this.MarkerManager.updateMarkers(this.props.benches);
    }
  }

  componentDidUpdate() {
    if (this.props.singleBench) {
      const singleBenchKey = Object.keys(this.props.benches)[0];
      const singleBench = this.props.benches[singleBenchKey];
      this.MarkerManager.updateMarkers([singleBench]);
    } else {
      this.MarkerManager.updateMarkers(this.props.benches);
    }
  }

  registerListeners() {
    google.maps.event.addListener(this.map, 'idle', () => {
      const { north, south, east, west } = this.map.getBounds().toJSON();
      const bounds = {
        northEast: { lat: north, lng: east },
        southWest: { lat: south, lng: west }
      }

      this.props.updateFilter('bounds', bounds)
    });

    google.maps.event.addListener(this.map, 'click', event => {
      const coords = {
        lat: event.latLng.lat(),
        lng: event.latLng.lng()
      }
      this.handleClick(coords);
    })
  }

  handleMarkerClick(bench) {
    this.props.history.push(`benches/${bench.id}`);
  }

  handleClick(coords) {
    this.props.history.push({
      pathname: 'benches/new',
      search: `lat=${coords.lat}&lng=${coords.lng}`
    });
  }

  render() {
    return <div id="map-container" ref={ map => this.mapNode = map }></div>
  }
}

export default withRouter(BenchMap);

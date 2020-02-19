export default class MarkerManager {
  constructor(map, handleClick) {
    this.map = map;
    this.markers = {};
    this.handleClick = handleClick;
  }

  updateMarkers(benches) {
    const benchesObj = {};
    benches.forEach(bench => benchesObj[bench.id] = bench);

    benches
      .filter(bench => !this.markers[bench.id])
      .forEach(newBench => this.createMarkerFromBench(newBench))

    Object.keys(this.markers)
      .filter(benchId => !benchesObj[benchId])
      .forEach((benchId) => this.removeMarker(this.markers[benchId]))
  }

  createMarkerFromBench(bench) {
    const position = new google.maps.LatLng(bench.lat, bench.lng);
    const marker = new google.maps.Marker({
      position,
      map: this.map,
      benchId: bench.id
    });

    marker.addListener('click', () => this.handleClick(bench));
    this.markers[marker.benchId] = marker;
  }

  removeMarker(marker) {
    this.markers[marker.benchId].setMap(null);
    delete this.markers[marker.benchId];
  }
}

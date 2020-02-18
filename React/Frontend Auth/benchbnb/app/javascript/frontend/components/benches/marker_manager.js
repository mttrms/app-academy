export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
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

    console.log(this.markers)
    console.log(benchesObj)
  }

  createMarkerFromBench(bench) {
    const position = new google.maps.LatLng(bench.lat, bench.lng);
    const marker = new google.maps.Marker({
      position,
      map: this.map,
      benchId: bench.id
    });

    this.markers[marker.benchId] = marker;
  }

  removeMarker(marker) {
    console.log('hi')
    console.log(marker)
    this.markers[marker.benchId].setMap(null);
    delete this.markers[marker.benchId];
  }
}

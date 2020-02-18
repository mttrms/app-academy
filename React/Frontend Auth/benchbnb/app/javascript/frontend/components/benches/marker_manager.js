export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
    console.log(this.map);
  }

  updateMarkers(benches) {
    benches
      .filter(bench => !this.markers[bench.id])
      .forEach(newBench => this.createMarkerFromBench(newBench))
  }

  createMarkerFromBench(bench) {
    const position = new google.maps.LatLng(bench.lat, bench.lng);
    const marker = new google.maps.Marker({
      position,
      map: this.map,
      benchId: bench.id
    });

    this.markers[marker.benchId] = marker;
    console.log(this.markers)
  }
}

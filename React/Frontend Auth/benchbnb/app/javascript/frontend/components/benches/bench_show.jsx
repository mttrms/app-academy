import React from 'react';
import { Link } from 'react-router-dom';

import BenchMap from './bench_map';

const BenchShow = ({ bench, benchId, fetchBench }) => {
  const benches = {
    [benchId]: bench
  };

  return(
    <div>
      <Link to="/">Back to all benches</Link>
      <BenchMap
        benches={benches}
        benchId={benchId}
        fetchBench={fetchBench}
        singleBench={true}
      />
      <div>
        Bench Detail:
        <ul>
          <li>Description: { bench.description }</li>
          <li>Seats: { bench.seating }</li>
          <li>Latitude: { bench.lat }</li>
          <li>Longitude: { bench.lng }</li>
        </ul>
      </div>
    </div>
  )
}

export default BenchShow;

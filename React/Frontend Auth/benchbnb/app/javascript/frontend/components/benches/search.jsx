import React from 'react';

import BenchIndex from './bench_index';
import BenchMap from './bench_map';

const Search = ({ benches, fetchBenches, updateBounds }) => {
  return (
    <div>
      <BenchMap benches={benches} updateBounds={updateBounds} />
      <BenchIndex benches={benches}  fetchBenches={fetchBenches}/>
    </div>
  )
};

export default Search;

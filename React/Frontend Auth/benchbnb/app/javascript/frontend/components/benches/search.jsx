import React from 'react';

import BenchIndex from './bench_index';
import BenchMap from './bench_map';

const Search = ({ benches, fetchBenches, updateFilter }) => {
  return (
    <div>
      <BenchMap benches={benches} updateFilter={updateFilter} />
      <BenchIndex benches={benches}  fetchBenches={fetchBenches}/>
    </div>
  )
};

export default Search;

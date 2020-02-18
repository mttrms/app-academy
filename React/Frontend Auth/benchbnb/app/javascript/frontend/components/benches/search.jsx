import React from 'react';

import BenchIndex from './bench_index';
import BenchMap from './bench_map';
import FilterForm from './filter_form';

const Search = ({ benches, minSeating, maxSeating, updateFilter }) => {
  return (
    <div>
      <BenchMap benches={benches} updateFilter={updateFilter} />
      <BenchIndex benches={benches} />
      <FilterForm
        minSeating={minSeating}
        maxSeating={maxSeating}
        updateFilter={updateFilter}
      />
    </div>
  )
};

export default Search;

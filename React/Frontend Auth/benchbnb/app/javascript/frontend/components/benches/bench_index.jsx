import React from 'react';
import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {
  render() {
    const { benches } = this.props;

    const benchItems = Object.keys(benches).map(id => {
      const bench = benches[id];
      return <BenchIndexItem key={bench.id} bench={bench} />
    });

    return benchItems;
  }
}

export default BenchIndex;

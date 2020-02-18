export const fetchBenches = filters => (
  $.ajax({
    method: 'GET',
    url: 'api/benches',
    data: filters
  })
);

export const createBench = benchData => (
  fetch('api/benches', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(benchData)
  })
  .then(response => response.json())
);

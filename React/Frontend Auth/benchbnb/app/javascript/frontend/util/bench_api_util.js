export const fetchBenches = filters => (
  fetch(`/api/benches`)
  .then(handleErrors)
  .then(response => response.json())
);

const handleErrors = response => {
  if (!response.ok) {
    throw response;
  }
  return response;
};

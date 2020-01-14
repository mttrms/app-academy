const handleErrors = response => {
  if (!response.ok) {
    throw Error(response.statusText);
  }
  return response;
};

export const fetchSearchGiphys = searchTerm => {
  return fetch(`http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=0IagJxo0zlozk2f5ID4SCl4dCQQ6NbZh&limit=2`)
  .then(handleErrors)
  .then(response => response.json())
  .catch(error => console.log(error))
};

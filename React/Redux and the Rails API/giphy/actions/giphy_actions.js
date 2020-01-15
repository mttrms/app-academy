import * as APIUtil from '../util/api_util';
export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';

export const receiveSearchGiphys = giphys => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys
  }
};

export const fetchSearchGiphys = searchTerm => {
  return (dispatch) => {
    APIUtil.fetchSearchGiphys(searchTerm)
      .then(response => response.json())
      .then(giphys => dispatch(receiveSearchGiphys(giphys.data)))
      .catch(error => console.log(error))
  }
};

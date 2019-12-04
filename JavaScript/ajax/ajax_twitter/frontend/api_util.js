const APIUtil = {
	followUser: id => {
		return $.ajax({
			url: `/users/${id}/follow`,
			type: 'POST',
			dataType: 'JSON'
		})
	},

	unfollowUser: id => {
		return $.ajax({
			url: `/users/${id}/follow`,
			type: 'DELETE',
			dataType: 'JSON'
		})
	},

	searchUsers: queryVal => {
		return $.ajax({
			url: '/users/search',
			type: 'GET',
			dataType: 'JSON',
			data: {query: queryVal}
		})
	},

	createTweet: data => {
		return $.ajax({
			url: '/tweets',
			type: 'POST',
			dataType: 'JSON',
			data: data
		})
	},

  getTweets: data => {
    return $.ajax({
      url: '/feed',
      type: 'GET',
      dataType: 'JSON',
      data
    })
  }
};

module.exports = APIUtil;

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
	}
};

module.exports = APIUtil;

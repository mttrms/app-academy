const APIUtil = require('./api_util.js');

class UsersSearch {
	constructor($el) {
		this.$el = $el;
		this.$input = $el.find('#users-search-field');
		this.$ul = $el.find('ul.users');
		this.handleClick()
	}

	handleClick() {
		this.$input.on('input', function(e) {
			const query = e.target.value;
			APIUtil.searchUsers(query)
				.then((res) => {
					console.log(res)
				})
		})
	}
}

module.exports = UsersSearch;


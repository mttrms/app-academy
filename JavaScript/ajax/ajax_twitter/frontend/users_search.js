const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js');

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
				.then(res => {
					this.renderResults(res);
				});
		}.bind(this));
	}

	renderResults(res) {
		this.$ul.empty();

		res.forEach(user => {
			const $li = $(`
				<li>
				<a href="/users/${user.id}">${user.username}</a>
				</li>`)

			const $followButton = $("<button></button>")
			$li.append($followButton);

			const followButtonOptions = {
				userId: user.id,
				followState: user.followed ? "followed" : "unfollowed"
			}

			new FollowToggle($followButton, followButtonOptions);

			this.$ul.append($li);
		})
	}
}

module.exports = UsersSearch;


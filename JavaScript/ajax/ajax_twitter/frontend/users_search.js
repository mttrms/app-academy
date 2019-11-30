class UsersSearch {
	constructor($el) {
		this.$el = $el;
		this.$input = $el.find('users-search-field');
		this.$ul = $el.find('ul.users');
	}
}

module.exports = UsersSearch;


const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");

$(document).ready(function() {
  const $buttons = $('.follow-toggle');
	const $usersSearches = $('nav.users-search');
  $buttons.each(function (idx, el) {
    const $button = $(el);
    new FollowToggle($button);
  });

	$usersSearches.each(function (idx, el) {
		const $usersSearch = $(el);
		new UsersSearch($usersSearch);
	});
});

const FollowToggle = require("./follow_toggle.js");

$(document).ready(function() {
  const $buttons = $('.follow-toggle');
  $buttons.each(function (idx, el) {
    const $button = $(el);
    const followButton = new FollowToggle($button);
  });
});
const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor($el, options) {
    this.userId = $el.data("user-id") || options.userId;
    this.followState = $el.data("initial-follow-state") || options.followState;
    this.el = $el;
    this.render();
    this.handleClick();
  }

  render() {
    if (this.followState === 'unfollowed') {
			this.el.prop('disabled', false);
      this.el.text('Follow!');
    } else if (this.followState === 'followed') {
			this.el.prop('disabled', false);
      this.el.text('Unfollow!');
    } else if (this.followState === 'unfollowing') {
			this.el.prop('disabled', true);
			this.el.text('Unfollowing');
		} else if (this.followState === 'following') {
			this.el.prop('disabled', true);
			this.el.text('Following');
		}
  }

	handleClick() {
		this.el.on("click", function(e) {
			e.preventDefault();

			if (this.followState === 'unfollowed') {
				this.followState = 'following';
				this.render();
				APIUtil.followUser(this.userId)
					.then(() => {
						this.followState = 'followed';
						this.render();
					});
			} else {
				this.followState = 'unfollowing';
				this.render();
				APIUtil.unfollowUser(this.userId)
					.then(() => {
						this.followState = 'unfollowed';
						this.render();
					});
			}
		}.bind(this));
	}
}

module.exports = FollowToggle;

class FollowToggle {
  constructor($el) {
    this.userId = $el.data("user-id");
    this.followState = $el.data("initial-follow-state");
    this.el = $el;
    this.render();
    this.handleClick();
  }

  render() {
    if (this.followState === 'unfollowed') {
      this.el.text('Follow!');
    } else {
      this.el.text('Unfollow!');
    }
  }

  handleClick() {
    this.el.on("click", function(e) {
      e.preventDefault();
      if (this.followState === 'unfollowed') {
        $.ajax({
          url: `/users/${this.userId}/follow`,
          type: 'POST',
          dataType: 'JSON',
          success: this._swapFollowState()
        })
      } else {
        $.ajax({
          url: `/users/${this.userId}/follow`,
          type: 'DELETE',
          dataType: 'JSON',
          success: this._swapFollowState()
        })
      }
    }.bind(this))
  }

  _swapFollowState() {
    if (this.followState === 'unfollowed') {
      this.followState = 'followed';
      this.el.text('Unfollow!');
    } else {
      this.followState = 'unfollowed';
      this.el.text('Follow!');
    }
  }
}

module.exports = FollowToggle;
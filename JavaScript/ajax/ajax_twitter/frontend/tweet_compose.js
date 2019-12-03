const APIUtil = require('./api_util.js');

class TweetCompose {
  constructor($el) {
    this.$el = $el;
    this.$ul = $($el.data("tweets-ul"));

    this.$el.on("submit", this.submit.bind(this));

    this.$el.find("textarea").on('input', (e) => {
      const $charsLeftCount = $(this.$el.find(".chars-left"));
      const charsLeft = 140 - e.currentTarget.value.length;
      $charsLeftCount.text(`${charsLeft} characters left`)
    });

    this.$el.find(".add-mentioned-user").on('click', (e) => {
      this.newUserSelect();
    });

    this.$el.find('.mentioned-users').on('click', '.remove-mentioned-user', (e) => {
      this.removeMentionedUser(e.currentTarget);
    });
  }

  submit(event) {
    event.preventDefault();
    const formData = this.$el.serializeJSON();
    const $formInputs = this.$el.find(":input");

    $formInputs.each((idx, el) => {
      const $formInput = $(el);
      $formInput.prop("disabled", true);
    })

    APIUtil.createTweet(formData).then(res => {
      this.handleSuccess(res);
    })
  }

  handleSuccess(res) {
    console.log(res);
    this.clearInput();
    const $li = $(`<li>${JSON.stringify(res)}</li>`);
    this.$ul.prepend($li);

    this.$el.find(":input").not(":input[type=submit]").each((idx, el) => {
      $(el).prop("disabled", false);
    })
  }

  clearInput() {
    const $formInputs = this.$el.find(":input:not(input[type='Submit'], :hidden)");
    $formInputs.each((idx, el) => {
      $(el).val('');
    })
    this.$el.find('.mentioned-users').empty();
    this.$el.find('.chars-left').empty();
  }

  newUserSelect() {
    const $mentionedUsers = $(this.$el.find(".mentioned-users"));
    const $userSelectDiv = $("<div>")
    const $select = $("<select name='tweet[mentioned_user_ids][]'>");
    const $removeMentionedUserLink = $('<a href="#" class="remove-mentioned-user">Remove</a>');


    window.users.forEach((user) => {
      $select
        .append($("<option></option>")
          .attr("value", user.id)
          .text(user.username));
    })

    $userSelectDiv.append($select);
    $userSelectDiv.append($removeMentionedUserLink);

    $mentionedUsers.append($userSelectDiv);
  }

  removeMentionedUser(target) {
    const $parentDiv = $(target).parent();
    $parentDiv.remove();
  }
}

module.exports = TweetCompose;

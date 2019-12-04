const APIUtil = require("./api_util.js");

class InfiniteTweets {
  constructor($el) {
    this.$el = $el;
    this.$feed = $el.find('#feed');
    this.lastCreatedAt = null;

    this.$el.find('.fetch-more').on('click', () => {
      this.fetchTweets();
    });
  }

  fetchTweets() {
    const data = {};

    if (this.lastCreatedAt) {
      data.max_created_at = this.lastCreatedAt;
    }

    APIUtil.getTweets(data).then(res => {
      this.insertTweets(res);
      this.lastCreatedAt = res[res.length-1].created_at

      if (res.length < 20) {
        this.$el.find('.fetch-more').remove();
        this.$el.append('<p>No more tweets to load.</p>');
      }
    });
  }

  insertTweets(tweets) {
    tweets.forEach((tweet) => {
      const $li = $("<li>");
      $li.append(JSON.stringify(tweet));
      this.$feed.append($li);
    })
  }
}

module.exports = InfiniteTweets;

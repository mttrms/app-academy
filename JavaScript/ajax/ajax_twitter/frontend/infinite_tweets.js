const APIUtil = require("./api_util.js");

class InfiniteTweets {
  constructor($el) {
    this.$el = $el;
    this.$feed = $el.find('#feed');

    this.$el.find('.fetch-more').on('click', () => {
      this.fetchTweets();
    });
  }

  fetchTweets() {
    APIUtil.getTweets().then(res => {
      this.insertTweets(res);
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

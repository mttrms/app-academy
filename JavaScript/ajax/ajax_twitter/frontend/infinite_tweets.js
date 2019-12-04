const APIUtil = require("./api_util.js");

class InfiniteTweets {
  constructor($el) {
    this.$el = $el;

    this.$el.find('.fetch-more').on('click', () => {
      this.fetchTweets();
    });
  }

  fetchTweets() {
    console.log(this.$el);
  }
}

module.exports = InfiniteTweets;

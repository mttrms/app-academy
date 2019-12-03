const APIUtil = require('./api_util.js');

class TweetCompose {
	constructor($el) {
		this.$el = $el;
		this.$el.on("submit", this.submit.bind(this));
	}

	submit(event) {
		event.preventDefault();
		const formData = this.$el.serializeJSON();
		APIUtil.createTweet(formData).then(res => {
			console.log(res);
		})
	}
}

module.exports = TweetCompose;

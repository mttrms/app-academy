const APIUtil = require('./api_util.js');

class TweetCompose {
	constructor($el) {
		this.$el = $el;
		this.$el.on("submit", this.submit.bind(this));
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
			$formInputs.each((idx, el) => {
				const $formInput = $(el);
				$formInput.prop("disabled", false);
			})
			console.log(res);
		})
	}
}

module.exports = TweetCompose;

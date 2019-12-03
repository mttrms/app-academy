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
			this.handleSuccess(res);
		})
	}

	handleSuccess(res) {
		this.clearInput();

		this.$el.find(":input").not(":input[type=submit]").each((idx, el) => {
			$(el).prop("disabled", false);
		})
	}

	clearInput() {
		const $formInputs = this.$el.find(":input:not(input[type='Submit'], :hidden)");
		$formInputs.each((idx, el) => {
			$(el).val('');
		})
	}

}

module.exports = TweetCompose;

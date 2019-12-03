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
		})
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
	}

}

module.exports = TweetCompose;

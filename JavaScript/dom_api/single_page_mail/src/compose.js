const MessageStore = require('./message_store.js');

const Compose = {
  render: function() {
    const div = document.createElement('div');
    div.className = 'new-message';
    div.innerHTML = this.renderForm();

    return div;
  },

  renderForm: function() {
    const message = MessageStore.getMessageDraft();
    const html = `
    <p class="new-message-header">New Message</p>
    <form class="compose-form">
      <input placeholder="Recipient" name="to" type="text" value=${message.to}>
      <input placeholder="Subject" name="subject" type="text" value=${message.subject}>
      <textarea name="body" rows="20">${message.body}</textarea>
      <button type="submit" class="btn btn-primary submit-message">Send</button>
    </form>
    `

    return html;
  }
}

module.exports = Compose;

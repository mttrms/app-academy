const MessageStore = require('./message_store.js');

const Sent = {
  render: function() {
    const ul = document.createElement('ul');
    const messages = MessageStore.getSentMessages();

    ul.className = 'messages';
    messages.forEach((message) => {
      const node = this.renderMessage(message);
      ul.appendChild(node);
    })

    return ul;
  },

  renderMessage: function(message) {
    const li = document.createElement('li');
    li.className = 'message';
    li.innerHTML = `<span class="to">${message.to}</span>
                    <span class="subject">${message.subject}</span>
                    <span class="body">${message.body}</span>`

    return li;
  }
}

module.exports = Sent;

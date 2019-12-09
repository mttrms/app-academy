const Inbox = {
  render: () => {
    const ul = document.createElement('ul');
    ul.className = 'messages';
    ul.innerHTML = 'An inbox message';
    return ul;
  }
}

module.exports = Inbox;

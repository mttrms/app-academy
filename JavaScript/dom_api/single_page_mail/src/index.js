const Router = require('./router.js');
const Inbox = require('./inbox.js');
const Sent = require('./sent.js');
const Compose = require('./compose.js');

const routes = {
  inbox: Inbox,
  sent: Sent,
  compose: Compose
};

document.addEventListener("DOMContentLoaded", () => {
  const sidebarNavLinks = document.querySelectorAll('.sidebar-nav li');
  const node = document.getElementsByClassName('content')[0];
  const router = new Router(node, routes);
  router.start();
  window.location.hash = '#inbox';

  sidebarNavLinks.forEach((element) => {
    element.addEventListener('click', () => {
      const hash = element.innerText.toLowerCase();
      window.location.hash = hash;
    })
  })
})

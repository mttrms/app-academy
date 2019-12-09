const Router = require('./router.js');
const Inbox = require('./inbox.js');

const routes = {
  inbox: Inbox
};

document.addEventListener("DOMContentLoaded", () => {
  const sidebarNavLinks = document.querySelectorAll('.sidebar-nav li');
  const node = document.getElementsByClassName('content')[0];
  const router = new Router(node, routes);
  router.start();

  sidebarNavLinks.forEach((element) => {
    element.addEventListener('click', () => {
      const hash = element.innerText.toLowerCase();
      window.location.hash = hash;
    })
  })
})

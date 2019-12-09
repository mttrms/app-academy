const Router = require('./router.js');

document.addEventListener("DOMContentLoaded", () => {
  const sidebarNavLinks = document.querySelectorAll('.sidebar-nav li');
  const node = document.getElementsByClassName('content')[0];
  const router = new Router(node);
  router.start();

  sidebarNavLinks.forEach((element) => {
    element.addEventListener('click', () => {
      const hash = element.innerText.toLowerCase();
      window.location.hash = hash;
    })
  })
})

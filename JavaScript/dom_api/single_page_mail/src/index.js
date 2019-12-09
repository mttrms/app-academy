document.addEventListener("DOMContentLoaded", () => {
  const sidebarNavLinks = document.querySelectorAll('.sidebar-nav li');

  sidebarNavLinks.forEach((element) => {
    element.addEventListener('click', () => {
      const hash = element.innerText.toLowerCase();
      window.location.hash = hash;
    })
  })
})

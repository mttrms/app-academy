class Router {
  constructor(node) {
    this.node = node;
  }

  start() {
    this.render();

    window.addEventListener('hashchange', () => {
      this.render();
    })
  }

  render() {
    this.node.innerHTML = '';
    const p = document.createElement('p');
    p.innerHTML = this.activeRoute();
    this.node.appendChild(p);
  }

  activeRoute() {
    return window.location.hash.substring(1);
  }
}

module.exports = Router;

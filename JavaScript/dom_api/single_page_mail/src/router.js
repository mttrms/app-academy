class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();

    window.addEventListener('hashchange', () => {
      this.render();
    })
  }

  render() {
    const component = this.activeRoute();

    if (component) {
      this.node.innerHTML = '';
      this.node.appendChild(component.render());
    } else {
      this.node.innerHTML = '';
    }
  }

  activeRoute() {
    const hash = window.location.hash.substring(1);
    return this.routes[hash];
  }
}

module.exports = Router;

const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = (arg) => {
  if (typeof arg === 'string') {
    const nodeList = document.querySelectorAll(arg);
    const nodes = new DOMNodeCollection(Array.from(nodeList));

    return nodes;
  } else if (arg instanceof HTMLElement) {
    const nodes = new DOMNodeCollection([arg]);

    return nodes;
  }

  return undefined;
}


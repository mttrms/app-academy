const DOMNodeCollection = require('./dom_node_collection.js');

const _documentReadyCallbacks = [];
let _documentReady = false;

window.$l = (arg) => {
  if (typeof arg === 'string') {
    const nodeList = document.querySelectorAll(arg);
    const nodes = new DOMNodeCollection(Array.from(nodeList));

    return nodes;
  } else if (arg instanceof HTMLElement) {
    const nodes = new DOMNodeCollection([arg]);

    return nodes;
  } else if (typeof arg === 'function') {
    registerCallback(arg);
  }
}

const registerCallback = (func) => {
  if (_documentReady) {
    func();
  } else {
    _documentReadyCallbacks.push(func);
  }
}

document.addEventListener("DOMContentLoaded", () => {
  _documentReady = true;
  _documentReadyCallbacks.forEach(func => func());
})

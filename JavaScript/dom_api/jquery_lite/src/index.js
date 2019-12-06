window.$l = (arg) => {
  if (typeof arg !== 'string') return undefined;

  const nodeList = document.querySelectorAll(arg);
  const nodes = Array.from(nodeList);

  return nodes;
}


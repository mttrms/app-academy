class DOMNodeCollection {
  constructor(htmlElementArr) {
    this.elements = htmlElementArr;
  }

  html(string) {
    if (string !== undefined) {
      this.elements.forEach(element => element.innerHTML = string);
    } else {
      return this.elements[0].innerHTML;
    }
  }

  empty() {
    this.html('');
  }

  append(children) {
    if (typeof children === 'object' && !(children instanceof DOMNodeCollection)) {
      children = $l(children);
    }

    if (typeof children === 'string') {
      this.elements.forEach(element => element.innerHTML += children);
    } else if (children instanceof DOMNodeCollection) {
      this.elements.forEach((element) => {
      })
    }
  }
}

module.exports = DOMNodeCollection;

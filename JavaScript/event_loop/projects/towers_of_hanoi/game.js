class Game {
  constructor(numOfDiscs) {
    this.towers = _makeTowers(numOfDiscs);
  }
}

const _makeTowers = (numOfDiscs) => {
  return [
    Array.from({length: numOfDiscs}, (x, i) => i + 1).reverse(),
    [],
    []
  ]
}

class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    const $ul = $("<ul><li></li></ul>")
    for (let i = 0; i < 8; i++) {
      const $li = $("<li></li>")
      $ul.append($li);
    }

    this.$el.append($ul)

    console.log($ul);
  }
}

module.exports = View;

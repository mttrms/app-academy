class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $ul = $('ul');
    const view = this;

    $ul.on("click", "li", function() {
      view.makeMove($(this))
    })
  }

  makeMove($square) {
    const idx = $('ul li').index($square);
    const y = Math.floor (idx / 3);
    const x = idx % 3;

    try {
      let currentPlayer = this.game.currentPlayer;
      this.game.playMove([y, x]);
      $square.toggleClass(currentPlayer);
    } catch (err) {
      alert(err.msg)
    }

    if (this.game.isOver()) {
      this.endGame();
    }
  }

  setupBoard() {
    const $ul = $("<ul></ul>")
    for (let i = 0; i < 9; i++) {
      const $li = $("<li></li>")
      $ul.append($li);
    }

    this.$el.append($ul)
  }

  endGame() {
    let winner = this.game.winner();
    $('ul').unbind();

    $('li').each(function() {
      if ($(this).hasClass(winner)) {
        $(this).addClass('winner');
      } else {
        $(this).addClass('loser');
      }
    })

    const $message = $("<figcaption></figcaption>")
    if (winner == null) {
      $message.text("It's a draw.");
    } else {
      $message.text(`You win, ${winner}!`);
    }
    this.$el.append($message);
    console.log($message)
  }
}

module.exports = View;

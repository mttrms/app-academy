require_relative "board"

class Game
  def initialize(size)
    @board = Board.new(size)
  end

  def play
    until @board.solved? || game_over?
      @board.render
      puts "What position would you like to guess?"
      pos = gets.chomp
      puts "Select R to reveal or F to flag a tile."
      selection = gets.chomp
      puts `clear`
    end
  end

  def game_over?
    false
  end
end

minesweeper = Game.new(9)
minesweeper.play
require_relative "board"

class Game
  def initialize(size)
    @board = Board.new(size)
  end

  def play
    until solved? || game_over?
      @board.render
      puts "What position would you like to guess?"
      pos = get_position
      puts "Select R to reveal or F to flag a tile."
      move = gets.chomp
      make_move(pos, move)
      puts `clear`
    end
    if game_over?
      puts "Boom! You lose."
    else
      puts "You win!"
    end
  end

  def get_position
    pos = gets.chomp
    pos.split(",").map(&:to_i)
  end

  def make_move(pos, move)
    if move == "R"
      @board[pos].reveal
    elsif move == "F"
      @board[pos].flag
    else
      play
    end
  end

  def game_over?
    @board.grid.each do |row|
      row.each do |tile|
        return true if tile.bombed && tile.revealed
      end
    end

    false
  end

  def solved?
    @board.grid.each do |row|
      row.each do |tile|
        return false if !tile.bombed && !tile.revealed
      end
    end

    true
  end
end

minesweeper = Game.new(9)
minesweeper.play
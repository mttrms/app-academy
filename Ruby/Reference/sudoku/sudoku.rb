require_relative "board"

class Sudoku
  attr_reader :board

  def initialize(filename)
    @board = Board.from_file(filename)
  end

  def play

  end

end

# game = Sudoku.new("sudoku1_almost.txt")
# game.play
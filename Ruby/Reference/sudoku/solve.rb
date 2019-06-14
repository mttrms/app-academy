require_relative "board"

class Solve
  
  def initialize(filename)
    @board = Board.from_file(filename)
    @grid = Board.build_grid(@board)
  end

  def find_cell(board)
    
  end

end

my_solve = Solve.new("sudoku1.txt")

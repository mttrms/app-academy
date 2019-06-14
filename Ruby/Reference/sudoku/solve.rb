require_relative "board"

class Solve
  
  def initialize(filename)
    @board = Board.from_file(filename)
    @grid = Board.build_grid(@board)
    @board.render
  end

  def find_cell(grid, cell)
    (0..8).each do |row_idx|
      (0..8).each do |col_idx|
        return [row_idx, col_idx] if grid[row_idx][col_idx] == 0
      end
    end
  end

end

my_solve = Solve.new("sudoku1.txt")

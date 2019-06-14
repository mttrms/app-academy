require_relative "board"

class Solve
  
  def initialize(filename)
    @board = Board.from_file(filename)
    @grid = Board.build_grid(@board)
    @board.render
    cell = [0,0]
    find_cell(@grid, cell)
    p cell
  end

  def find_cell(grid, cell)
    (0..8).each do |row_idx|
      (0..8).each do |col_idx|
        if grid[row_idx][col_idx] == 0
          cell[0] = row_idx
          cell[1] = col_idx
          return true
        end
      end
    end

    false
  end

end

my_solve = Solve.new("sudoku2.txt")

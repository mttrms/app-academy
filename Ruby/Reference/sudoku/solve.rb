require_relative "board"

class Solve
  
  def initialize(filename)
    @board = Board.from_file(filename)
    @grid = Board.build_grid(@board)
    @board.render
    p is_valid_placement?(@grid, 0, 1, 3)
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

  def is_valid_placement?(grid, row, col, num)
    is_valid_row?(grid, row, num) && is_valid_col?(grid, col, num)
  end

  def is_valid_row?(grid, row, num)
    return false if grid[row].include?(num)
    true
  end

  def is_valid_col?(grid, col, num)
    return false if grid.transpose[col].include?(num)
    true
  end

  def fill(grid)
    cell = [0,0]
    
    # base case
    if find_cell(@grid, cell) == false
      p "solved!"
      return true
    end

    row = cell[0]
    col = cell[1]
    
    (1..9).each do |num|

    end
  end
end

my_solve = Solve.new("sudoku2.txt")

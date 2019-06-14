require_relative "board"

class Solve
  
  def initialize(filename)
    @board = Board.from_file(filename)
    @grid = Board.build_grid(@board)
    @board.render
    fill(@grid)
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
    is_valid_row?(grid, row, num) && is_valid_col?(grid, col, num) && is_valid_square?(grid, row, col, num)
  end

  def is_valid_row?(grid, row, num)
    return false if grid[row].include?(num)
    true
  end

  def is_valid_col?(grid, col, num)
    return false if grid.transpose[col].include?(num)
    true
  end

  def is_valid_square?(grid, row, col, num)
    return false if square(grid, row, col).include?(num)
    true
  end

  def square(grid, row, col)
    tiles = []

    row_idx = (row / 3) * 3
    col_idx = (col / 3) * 3

    (row_idx...row_idx + 3).each do |i|
      (col_idx...col_idx + 3).each do |j|
        tiles << grid[i][j]
      end
    end

    tiles
  end

  def fill(grid)
    cell = [0,0]
    
    # base case
    if find_cell(grid, cell) == false
      p "solved!"
      pp grid
      return true
    end

    # set row and col to match first empty cell
    row = cell[0]
    col = cell[1]
    
    (1..9).each do |num|
      if is_valid_placement?(grid, row, col, num)
        grid[row][col] = num
        return true if fill(grid)
        grid[row][col] = 0
      end
    end

    # not a valid solution, backtrack
    false
  end
end

my_solve = Solve.new("sudoku1.txt")

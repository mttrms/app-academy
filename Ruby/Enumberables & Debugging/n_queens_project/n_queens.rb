def create_board(n)
  board = []
  n.times do
    row = []
    n.times do
      row << "_"
    end
  board << row
  end
  
  board
end

def place_queen(col)
  # @queens = []
  (0...@board.length).each do |row|
    if is_valid?([row, col])
      p "yes"
    else
      p "not safe"
    end
  end
  
end

def is_valid?(pos)
  valid_column?(pos) && valid_row?(pos) && valid_diagonal?(pos)
end

def valid_column?(pos)
  row, col = pos[0], pos[1]
  @board.length.times do |row|
    return false if @board[row][col] == "Q"
  end

  true
end

def valid_row?(pos)
  row, col = pos[0], pos[1]
  @board.length.times do |col|
    return false if @board[row][col] == "Q"
  end

  true
end

def valid_diagonal?(pos)
  row, col = pos[0], pos[1]
  (0...@board.length).each do |y|
    (0...@board.length).each do |x|
      delta_row = (row - y).abs
      delta_col = (col - x).abs
      return false if @board[y][x] == "Q" && delta_col == delta_row
      # p "false"
    end

    true
  end

  true
end





@board = create_board(4)
@board[1][3] = "Q"
pp @board

place_queen(0)



# Pseudocode
# Place a Q in row 0, column 0
# Move to (column 0 + 1), place Q in first available row
# Move to (column 1 + 1), place Q in first available row
# Identify no available rows, return false up to initial placement, increase row by 1, restart placement
# When last column has a queen placed, return true

# Queen rules
# Cannot share a column
# Cannot share a row
# Cannot share a diagonal
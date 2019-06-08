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
  @queens = []
  (0...@board.length).each do |row|
    if is_valid?([row, col])
      p "yes"
    else
      p "not safe"
    end
  end
  
end

def is_valid?(pos)
  valid_column?(pos) && valid_row?(pos) && valid_diaganol?(pos)
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

def valid_diaganol?(pos)
  row, col = pos[0], pos[1]
  @queens.each do |queen|
    q_row, q_col = queen[0], queen[1]
    delta_row = (row - q_row)
    delta_col = (col - q_col)
    return false if delta_row == delta_col  
  end
  
  true
end





@board = create_board(4)
# @board[2][2] = "Q"
pp @board

place_queen(1)



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
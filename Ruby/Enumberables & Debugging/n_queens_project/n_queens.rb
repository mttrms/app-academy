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
  # base case
  return true if col >= @board.length

  (0...@board.length).each do |row|
    if is_valid?([row, col])
      @board[row][col] = "Q"

      # check if this leads to a solution
      return true if place_queen(col + 1)

      # remove the last placed queen because this wasn't a solution
      @board[row][col] = "_"
    end
  end
  
  false
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
    end
  end

  true
end





@board = create_board(12)
place_queen(0)
pp @board

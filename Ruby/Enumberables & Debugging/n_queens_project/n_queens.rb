puts "What size board should we solve?"
size = gets.chomp.to_i

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
      @queens << [row, col]

      # check if this leads to a solution
      return true if place_queen(col + 1)

      # remove the last placed queen because this wasn't a solution
      @board[row][col] = "_"
      @queens.pop
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
  @queens.each do |queen|
    queen_row = queen[0]
    queen_col = queen[1]

    delta_row = (row - queen_row).abs
    delta_col = (col - queen_col).abs
    return false if delta_col == delta_row

  end

  true
end

# create board, solve with timer
@board = create_board(size)
@queens = []

start_time = Time.now
place_queen(0)
end_time = Time.now
elapsed = end_time - start_time

# print the solved board
@board.each do |row|
  p row
end

puts "That took #{elapsed} seconds!"
puts "The queens were placed here: #{@queens}"
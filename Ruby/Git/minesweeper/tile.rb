require "byebug"

class Tile
  attr_reader :bombed, :revealed, :flagged

  def initialize(board)
    @bombed = false
    @flagged = false
    @revealed = false
    @board = board
    @position = []
    @neighbors = {}
    @bomb_count = 0
  end

  def place_bomb
    @bombed = true
  end

  def reveal
    @revealed = true
    @flagged = false
    if !@neighbors.has_value?(true)
      @neighbors.each_key do |pos|
        @board[pos].reveal if @board[pos].revealed == false
      end
    end
  end

  def flag
    @flagged = true
  end

  def inspect
    if flagged
      "F"
    elsif !self.revealed
      "*"
    elsif revealed
      @bomb_count
    else
      "_"
    end
  end

  def position(pos)
    @position = pos
  end

  def valid_position?(pos)
    row, col = pos
    if row >= 0 && row < @board.grid.length && col >= 0 && col < @board.grid.length
      return true
    end

    false
  end

  def find_neighbors
    row, col = @position
    left            = [row, col - 1]
    right           = [row, col + 1]
    up              = [row - 1, col]
    down            = [row + 1, col]
    diag_left_up    = [row - 1, col - 1]
    diag_left_down  = [row + 1, col - 1]
    diag_right_up   = [row - 1, col + 1]
    diag_right_down = [row + 1, col + 1]

    directions = [left, right, up, down, diag_left_up, diag_left_down, diag_right_up, diag_right_down]

    directions.each do |pos|
      @neighbors[pos] = @board[pos].bombed if valid_position?(pos)
    end

    @neighbors
  end

  def adjacent_bomb_count
    @bomb_count += @neighbors.each_value.select { |bomb| bomb == true }.length
  end
end
require "byebug"

class Tile
  attr_reader :bombed, :revealed, :flagged

  def initialize(board)
    @bombed = false
    @flagged = false
    @revealed = false
    @board = board
    @position = []
    @neighbors = []
  end

  def place_bomb
    @bombed = true
  end

  def reveal
    @revealed = true
    @flagged = false
  end

  def flag
    @flagged = true
  end

  def inspect
    if flagged
      "F"
    elsif !self.revealed
      "*"
    else
      "_"
    end
  end

  def position(pos)
    @position = pos
  end

  def find_neighbors
  end
end
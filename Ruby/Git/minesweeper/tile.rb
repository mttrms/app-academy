class Tile
  attr_reader :bombed, :revealed, :flagged

  def initialize(board)
    @bombed = false
    @flagged = false
    @revealed = false
    @board = board
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
end
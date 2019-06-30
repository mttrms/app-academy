class Tile
  attr_reader :bombed, :revealed, :flagged

  def initialize
    @bombed = false
    @flagged = false
    @revealed = false
  end

  def place_bomb
    @bombed = true
  end

  def inspect
    if !self.revealed
      "*"
    elsif flagged
      "F"
    else
      "_"
    end
  end
end
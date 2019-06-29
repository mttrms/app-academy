class Tile
  attr_reader :bombed

  def initialize
    @bombed = false
    @flagged = false
    @revealed = false
  end

  def place_bomb
    @bombed = true
  end
end
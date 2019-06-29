class Tile
  def initialize
    @bombed = false
    @flagged = false
    @revealed = false
  end

  def place_bomb
    @bombed = true
  end
end
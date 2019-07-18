class Piece
  attr_accessor :pos
  
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def moves
  end
end
class Piece
  attr_accessor :pos
  attr_reader :color
  
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def moves
  end
end
class Piece
  attr_accessor :pos
  attr_reader :color, :symbol
  
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def to_s
    symbol
  end

  def valid_moves
  end

  def moves
  end
end
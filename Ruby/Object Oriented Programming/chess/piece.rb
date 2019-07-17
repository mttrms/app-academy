require_relative 'slideable'

class Piece
  attr_reader :pos
  
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def moves
  end
end
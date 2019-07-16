require_relative 'slideable'

class Piece
  attr_reader :pos
  
  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def moves
  end
end
require 'singleton'

class NullPiece < Piece
  include Singleton

  def symbol
    ' '
  end

  def initialize
  end
end
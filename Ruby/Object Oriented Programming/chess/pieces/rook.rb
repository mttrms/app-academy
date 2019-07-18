class Rook < Piece
  include Slideable

  def symbol
    '♜'
  end

  def move_dirs
    horizontal_dirs
  end
end
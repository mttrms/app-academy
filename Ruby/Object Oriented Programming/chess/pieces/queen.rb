class Queen < Piece
  include Slideable

  def symbol
    '♛'
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end
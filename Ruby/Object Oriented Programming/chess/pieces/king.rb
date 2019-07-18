class King < Piece
  include Steppable

  def symbol
    '♚'
  end

  def move_diffs
    [[-1, 0],
      [1, 0],
      [0, -1],
      [0, 1],
      [-1, -1],
      [-1, 1],
      [1, -1],
      [1, 1]]
  end
end
class Knight < Piece
  include Steppable

  def symbol
    '♞'
  end

  def move_diffs
    [
      [-2, 1],
      [-2, -1],
      [2, 1],
      [2, -1],
      [-1, 2],
      [-1, -2],
      [1, 2],
      [1, -2]
    ]
  end
end
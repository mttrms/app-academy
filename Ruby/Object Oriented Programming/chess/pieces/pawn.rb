class Pawn < Piece
  def move_dirs
    forward_steps
  end

  private
  def at_start_row?
    pos[0] == 1 || pos[0] == 6
  end

  def forward_dir
    @color == :white ? -1 : 1
  end

  def forward_steps
    moves = []
    col, row = pos
    moves << [col + forward_dir, row]
    moves << [col + (forward_dir * 2), row] if at_start_row?

    moves
  end

  def side_attacks
  end
end
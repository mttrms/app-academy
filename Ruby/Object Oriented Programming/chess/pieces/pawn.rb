class Pawn < Piece
  def move_dirs
    []
  end

  private

  def at_start_row?
    pos[0] == 1 || pos[0] == 6
  end

  def forward_dir
    # returns 1 or -1
  end

  def forward_steps
  end

  def side_attacks
  end
end
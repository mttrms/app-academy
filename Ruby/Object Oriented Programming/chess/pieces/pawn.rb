class Pawn < Piece

  def symbol
    if @color == :black
      '♟'
    else
      '♙'
    end
  end

  def moves
    forward_steps + side_attacks
  end

  private
  def at_start_row?
    @color == :white && pos[0] == 1 || @color == :black && pos[0] == 6
  end

  def forward_dir
    @color == :white ? 1 : -1
  end

  def forward_steps
    moves = []
    col, row = pos
    moves << [col + forward_dir, row] if @board[[col + forward_dir, row]].class == NullPiece
    moves << [col + (forward_dir * 2), row] if at_start_row? && @board[[col + (forward_dir * 2), row]].class == NullPiece

    moves
  end

  def side_attacks
    side_attack_1 = [pos[0] + forward_dir, pos[1] - 1]
    side_attack_2 = [pos[0] + forward_dir, pos[1] + 1]
    attacks = [side_attack_1, side_attack_2]

    attacks.select do |attack_pos|
      next if @board[attack_pos].class == NullPiece
      @board.valid_pos?(attack_pos) && @board[attack_pos].color != @color
    end
  end
end
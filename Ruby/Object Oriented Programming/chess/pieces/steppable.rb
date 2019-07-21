module Steppable
  def moves
    possible_moves = Array.new

    move_diffs.each do |move|
      dy, dx = move
      possible_move = [pos[0] + dy, pos[1] + dx]
      next unless @board.valid_pos?(possible_move)
      if @board[possible_move].class == NullPiece || @board[possible_move].color != color
        possible_moves << possible_move
      end
    end

    possible_moves
  end
end
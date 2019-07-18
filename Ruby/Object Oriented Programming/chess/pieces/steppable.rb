module Steppable
  def moves
    possible_moves = Array.new

    move_diffs.each do |move|
      dy, dx = move
      possible_move = [pos[0] + dy, pos[1] + dx]
      if @board[possible_move].class == NullPiece
        possible_moves << possible_move
      end
    end

    possible_moves
  end
end
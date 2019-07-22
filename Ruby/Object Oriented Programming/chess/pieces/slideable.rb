module Slideable
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    # debugger
    possible_moves = []

    move_dirs.each do |move|
      dy, dx = move
      possible_moves += grow_unblocked_moves_in_dir(dx, dy)
    end

    possible_moves
  end
  
  def grow_unblocked_moves_in_dir(dx, dy)
    # Set possible_move to 1 square away, in the dx/dy given.
    possible_move = [pos[0] + dy, pos[1] + dx]
    valid_moves = []

    until @board.valid_pos?(possible_move) == false
      if @board[possible_move].class == NullPiece
        valid_moves << possible_move.clone
      elsif @board[possible_move].color != color
        valid_moves << possible_move.clone
        break
      else
        break
      end
      possible_move[0] += dy
      possible_move[1] += dx
    end

    valid_moves
  end

  private
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
end
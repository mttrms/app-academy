module Slideable
  def grow_unblocked_moves_in_dir(dx, dy)
    moves_in_dir = []

    current_position = pos
    possible_move = [pos[0] + dy, pos[1] + dx]
    while @board[possible_move].class == NullPiece
      moves_in_dir << possible_move
      possible_move[0] += dy
      possible_move[1] += dx
    end
    
    moves_in_dir
  end

  def horizontal_dirs
    horizontal_moves = []

    HORIZONTAL_DIRS.each do |dir|
      dy, dx = dir
      horizontal_moves += grow_unblocked_moves_in_dir(dx, dy)
    end

    horizontal_moves
  end

  def diagonal_dirs
  end

  def moves
    
  end

  private
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
end
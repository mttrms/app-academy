module Slideable
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    possible_moves = Array.new

    move_dirs.each do |move|
      dy, dx = move
      possible_moves += grow_unblocked_moves_in_dir(dx, dy)
    end

    possible_moves
  end
  
  def grow_unblocked_moves_in_dir(dx, dy)
    # Method that returns an array of every valid move in a given dx, dy
    # Example: grow_unblocked_moves_in_dir(0, 1) # => Valid moves going DOWN
  end

  private
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
end
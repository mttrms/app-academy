require_relative 'poly_tree_node'

class KnightPathFinder
  def initialize(start_pos)
    @start_position = start_pos
  end

  def self.valid_moves(pos)
    row, col = pos

    moves = [
      [row - 2, col + 1],
      [row - 2, col - 1],
      [row + 2, col + 1],
      [row + 2, col - 1],
      [row - 1, col + 2],
      [row - 1, col - 2],
      [row + 1, col + 2],
      [row + 1, col - 2]
    ]

    moves.select do |new_position|
      row, col = new_position
      row >= 0 && row <= 8 && col >= 0 && col <= 8
    end
  end
end

p KnightPathFinder.valid_moves([3,3])
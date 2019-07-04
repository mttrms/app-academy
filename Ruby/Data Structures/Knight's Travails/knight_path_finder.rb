require_relative 'poly_tree_node'

class KnightPathFinder
  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [start_pos]
    build_move_tree
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
      KnightPathFinder.valid_position(row) && KnightPathFinder.valid_position(col)
    end
  end

  def self.valid_position(pos)
    pos >= 0 && pos < 8
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos).select{ |new_position| !@considered_positions.include?(new_position) }
    new_moves.each { |position| @considered_positions << position }
  end

  def build_move_tree
    @considered_positions.each do |position|
      new_move_positions(position)
      p position
    end
  end
end

kpf = KnightPathFinder.new([0,0])
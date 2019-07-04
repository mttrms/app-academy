require_relative 'poly_tree_node'

class KnightPathFinder
  attr_reader :start_pos
  attr_accessor :root_node

  def initialize(start_pos)
    @start_pos = start_pos
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
    self.root_node = PolyTreeNode.new(start_pos)

    nodes = [@root_node]
    until nodes.empty?
      current_node = nodes.shift

      current_pos = current_node.value
      new_move_positions(current_pos).each do |next_pos|
        next_node = PolyTreeNode.new(next_pos)
        current_node.add_child(next_node)
        nodes << next_node
      end
    end
  end

  def find_path(end_pos)
    end_node = root_node.dfs(end_pos)
    trace_path_back(end_node).reverse
  end

  def trace_path_back(end_node)
    path = []

    current_node = end_node
    until current_node.nil?
      path << current_node
      current_node = current_node.parent
    end
    
    path
  end
end

kpf = KnightPathFinder.new([0,0])
p kpf.find_path([7,6])

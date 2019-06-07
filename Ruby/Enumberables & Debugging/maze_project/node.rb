# A position on the maze
class Node
  attr_accessor :x, :y, :parent, :children, :movement_cost, :h_value, :coordinates, :f_value
  def initialize(coordinates)
    @coordinates = coordinates
    @y = @coordinates[0]
    @x = @coordinates[1]
    @movement_cost
    @h_value
    @f_value
    @parent
    @children = []
  end

  def build_path_values(parent_node)
    @parent = parent_node 
    @h_value = calculate_h_value(self)
    @movement_cost = calculate_movement_cost(self)
    @f_value = h_value + movement_cost
  end
end
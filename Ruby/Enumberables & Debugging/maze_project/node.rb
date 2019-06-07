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
end
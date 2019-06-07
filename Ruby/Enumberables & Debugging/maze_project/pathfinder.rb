# An A* pathfinding algorithm to solve ASCII mazes.

require 'set'

def generate_maze(puzzle)
  maze = []
  File.open(File.dirname(__FILE__) + "/#{puzzle}").each do |line|    
      parsed_line = []
      line.each_char do |char|
          if char == "*"
              parsed_line << "#"
          elsif char == " "
              parsed_line << "."
          elsif char == "S" || char == "E"
              parsed_line << char
          end
      end
      maze << parsed_line
  end

  maze
end

maze = generate_maze("maze_01.txt")

def find_start(maze)
end



# The open list contains squares that need to be checked out.
open_list = Set.new

# The closed list don't need to be looked at again (for now)
closed_list = Set.new



class Node
  attr_accessor :x, :y, :parent, :children, :cost, :h_value
  def initialize(coordinates)
    @y = coordinates[0]
    @x = coordinates[1]
    @cost
    @h_value
    @f_value
    @parent
    @children = []
  end
end

a = Node.new([0,8])

# An A* pathfinding algorithm to solve ASCII mazes.

require 'set'
require_relative 'node'

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

MAZE = generate_maze("maze_01.txt")

# The open list contains squares that need to be checked out
$open_list = Set.new

# The closed list doesn't need to be looked at again (for now)
$closed_list = Set.new

def generate_start_node(maze)
  starting_coordinates = []

  maze.each_with_index do |row, row_idx|
    starting_coordinates = [row_idx, row.index("S")] if row.include?("S")
  end

  start = Node.new(starting_coordinates)
  start.f_value = 0
  start
end

start_node = generate_start_node(MAZE)
$open_list << start_node

def find_best_node(list)
  best_node = nil
  lowest_f_value = nil

  list.each do |node|
    if best_node == nil
      best_node = node
      lowest_f_value = node.f_value
    elsif node.f_value < lowest_f_value
      best_node = node
      lowest_f_value = node.f_value
    end
  end
  
  best_node
end


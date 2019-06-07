# An A* pathfinding algorithm to solve ASCII mazes.

require 'byebug'
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

def find_end_coordinates(maze)
  end_coordinates = []

  maze.each_with_index do |row, row_idx|
    end_coordinates = [row_idx, row.index("E")] if row.include?("E")
  end

  end_coordinates
end

def generate_start_node(maze)
  starting_coordinates = []

  maze.each_with_index do |row, row_idx|
    starting_coordinates = [row_idx, row.index("S")] if row.include?("S")
  end

  start = Node.new(starting_coordinates)
  start.movement_cost = 0
  start.h_value = 0
  start.f_value = 0

  start
end

start_node = generate_start_node(MAZE)
$end_coords = find_end_coordinates(MAZE)
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

def generate_children(node)
  y = node.y
  x = node.x

  up    = MAZE[y - 1][x]
  down  = MAZE[y + 1][x]
  left  = MAZE[y][x - 1]
  right = MAZE[y][x + 1]

  if is_valid?(up)
    child_node = Node.new([y - 1, x])
    child_node.parent = node
    child_node.h_value = calculate_h_value(child_node)
    child_node.movement_cost = calculate_movement_cost(child_node)
    child_node.f_value = child_node.h_value + child_node.movement_cost
    $open_list << child_node if is_favorite_child?(child_node)
  end

  if is_valid?(down)
    child_node = Node.new([y + 1, x])
    child_node.parent = node
    child_node.h_value = calculate_h_value(child_node)
    child_node.movement_cost = calculate_movement_cost(child_node)
    child_node.f_value = child_node.h_value + child_node.movement_cost
    $open_list << child_node if is_favorite_child?(child_node)
  end

  if is_valid?(left)
    child_node = Node.new([y, x - 1])
    child_node.parent = node
    child_node.h_value = calculate_h_value(child_node)
    child_node.movement_cost = calculate_movement_cost(child_node)
    child_node.f_value = child_node.h_value + child_node.movement_cost
    $open_list << child_node if is_favorite_child?(child_node)
  end

  if is_valid?(right)
    child_node = Node.new([y, x + 1])
    child_node.parent = node
    child_node.h_value = calculate_h_value(child_node)
    child_node.movement_cost = calculate_movement_cost(child_node)
    child_node.f_value = child_node.h_value + child_node.movement_cost
    $open_list << child_node if is_favorite_child?(child_node)
  end
end

def is_valid?(node_value)
  return false if node_value == nil || node_value == "#"
  true
end

def is_favorite_child?(child_node)
  $open_list.each do |node|
    if node.coordinates == child_node.coordinates && node.movement_cost < child_node.movement_cost
      $open_list.delete(node)
      return false
    end
  end

  true
end

def calculate_h_value(node)
  y_end = $end_coords[0]
  x_end = $end_coords[1]
  y_now = node.y
  x_now = node.x
  h_value = (x_now - x_end).abs + (y_now - y_end).abs
  
  h_value
end

def calculate_movement_cost(node)
  parent_movement_cost = node.parent.movement_cost
  node.movement_cost = parent_movement_cost + 1
end

20.times do
  # debugger
  current_node = find_best_node($open_list)
  $closed_list << current_node
  $open_list.delete(current_node)
  generate_children(current_node)
end




# is_favorite_child?(a)

$open_list.each do |node|
  
end
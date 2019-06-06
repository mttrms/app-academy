require 'set'

class Maze
  def initialize(maze_name)
      @simple_puzzle = generate_maze(maze_name)
      # @simple_puzzle = [
      #   ["#",".",".",".",".",".",".","E"],
      #   ["#",".",".",".",".",".","S","."]
      # ]
      @current_position = find_start(@simple_puzzle)
      @end_position = find_end(@simple_puzzle)
    
      @traversed = Set.new
      

      # print_maze(@simple_puzzle)
      make_move(@current_position)
      # p @simple_puzzle[2][1]
  end

  def generate_maze(puzzle)
      @maze = []
      File.open(File.dirname(__FILE__) + "/#{puzzle}").each do |line|
          
          parsed_line = []
          line.each_char do |char|
              # puts char

              if char == "*"
                  parsed_line << "#"
              elsif char == " "
                  parsed_line << "."
              elsif char == "S" || char == "E"
                  parsed_line << char
              end

          end
          @maze << parsed_line
          
      end

      @maze
  end

  def print_maze(maze)
    maze.each do |row|
      p row
    end
  end

  def find_start(maze)
    maze.each_with_index do |row, idx|
      if row.include?("S")
        start_pos = [idx, row.index("S")]
        return start_pos
      end
    end
  end

  def find_end(maze)
    maze.each_with_index do |row, idx|
      if row.include?("E")
      end_pos = [idx, row.index("E")]
        return end_pos
      end
    end
  end

  def make_move(current_position)
    
    
    x = current_position[1]
    y = current_position[0]
    
    if x < 0 || y < 0 || x > @simple_puzzle[0].length || y > @simple_puzzle.length
      return false
    end

    if @simple_puzzle[y][x] == "E"
      p current_position
      return true
    end
    
    if @simple_puzzle[y][x] == "#" || @traversed.include?(current_position)
      return false
    end

    

    @traversed << current_position

    # try left
    if make_move([y, x - 1]) 
      p current_position
      return true
    end

    # try up
    if make_move([y - 1, x])
      p current_position
      return true
    end

    # try right
    if make_move([y, x + 1])
      p current_position
      return true
    end

    # try down
    if make_move([y + 1, x])
      p current_position
      return true
    end
    
    #   make_move([y, x - 1])
    # el  sif @simple_puzzle[y - 1][x]
    #   puts "up"
    # end

  end

end

test = Maze.new("maze_01.txt")
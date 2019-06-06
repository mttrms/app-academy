class Maze
  def initialize(maze_name)
      @puzzle = generate_maze(maze_name)
      @simple_puzzle = [
        ["#","#","#","#","#","#","#","#"],
        ["#",".",".",".",".",".","S","."]
      ]
      print_maze(@simple_puzzle)
      p find_start(@simple_puzzle)
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

  def make_move(current_position)
  end

end

test = Maze.new("maze_01.txt")
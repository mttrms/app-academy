class Maze
  def initialize(maze_name)
      @puzzle = generate_maze(maze_name)
      print_maze(@puzzle)
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

end

test = Maze.new("maze_01.txt")
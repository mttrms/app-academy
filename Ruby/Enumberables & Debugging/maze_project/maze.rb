class Maze
    def initialize(puzzle)
        @puzzle = []
        File.open(File.dirname(__FILE__) + "/#{puzzle}").each do |line|
            
            parsed_line = []
            line.each_char do |char|
                puts char

                if char == "*"
                    parsed_line << "#"
                elsif char == " "
                    parsed_line << "."
                elsif char == "S" || char == "E"
                    parsed_line << char
                end

            end
            @puzzle << parsed_line
            
        end
        @puzzle.each do |line|
            p line
        end
    end

end

test = Maze.new("maze_01.txt")
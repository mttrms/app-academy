require_relative "board"

class Solve
  
  def initialize(filename)
    @board = Board.from_file(filename)
  end
end

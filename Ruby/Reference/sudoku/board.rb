require_relative "tile"

class Board

  def self.from_file(filename)
    File.readlines("#{filename}").each do |line|
      line.each_char do |tile|
        p Tile.new(tile, true)
      end
    end
  end

  def initialize(grid)
        
  end
end

b = Board.from_file("sudoku1_almost.txt")
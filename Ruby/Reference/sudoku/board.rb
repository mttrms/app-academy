require_relative "tile"

class Board

  def self.from_file(filename)
    rows = File.readlines("#{filename}").map(&:chomp)
    grid = rows.map do |row|
      numbers = row.split("").map { |num| num.to_i }
      numbers.map { |num| Tile.new(num, true) }
    end

    self.new(grid)
  end

  def initialize(grid)
    @grid = grid
  end

  def render
    @grid.each do |row|
      row.each do |tile|
        print tile.to_s
      end
      puts ""
    end
  end

end

b = Board.from_file("sudoku1_almost.txt")
b.render
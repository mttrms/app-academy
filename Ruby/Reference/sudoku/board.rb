require_relative "tile"

class Board

  def self.from_file(filename)
    rows = File.readlines("#{filename}").map(&:chomp)
    grid = rows.map do |row|
      numbers = row.split("").map { |num| num.to_i }
      numbers.map { |num| Tile.new(num, num != 0) }
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

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    tile = @grid[row][col]
    tile.value = val if tile.given == false
  end

end

b = Board.from_file("sudoku1_almost.txt")
b.render

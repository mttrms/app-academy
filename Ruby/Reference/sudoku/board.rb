require_relative "tile"
require "pry"

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

  def solved?
  end

  def check_nums(sections)
    solution = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    sections.all? { |section| section.sort == solution }
  end

  def rows
    @grid.map do |row|
      row.map { |tile| tile.value }
    end
  end

  def columns
    @grid.transpose.map do |col|
      col.map { |tile| tile.value }
    end
  end

  def squares
    
  end

  def square(idx)
    tiles = []

    x = (idx / 3) * 3
    y = (idx % 3) * 3

    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        tiles << self[[i,j]].value
      end
    end

    tiles
  end
end

b = Board.from_file("sudoku1_almost.txt")
b.render

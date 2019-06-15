require_relative "tile"
require "pry"

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file(filename)
    rows = File.readlines("#{filename}").map(&:chomp)
    grid = rows.map do |row|
      numbers = row.split("").map { |num| num.to_i }
      numbers.map { |num| Tile.new(num, num != 0) }
    end

    self.new(grid)
  end

  def render
    puts `clear`
    puts "  #{(0..8).to_a.join("")}".colorize(:green)
    @grid.each.each_with_index do |row, idx|
      print "#{idx} ".colorize(:green)
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
    sections = [rows, columns, squares]
    sections.all? { |section| check_nums(section) }
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
    (0..8).to_a.map do |idx|
      square(idx)
    end
  end

  def square(idx)
    tiles = []

    row_idx = (idx / 3) * 3
    col_idx = (idx % 3) * 3

    (row_idx...row_idx + 3).each do |i|
      (col_idx...col_idx + 3).each do |j|
        tiles << self[[i,j]].value
      end
    end

    tiles
  end
end

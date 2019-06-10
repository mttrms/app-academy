require_relative "card"

class Board
  attr_reader :grid
  def initialize
    @grid = create_grid(3)
    populate
    p grid_full?
  end

  def create_grid(n)
    grid = Array.new(n + 1) { Array.new(n + 1) }
  end

  def cards
    ("A".."Z").to_a
  end

  def populate
    
  end

  def grid_full?
    @grid.each do |row|
      return false if row.any? { |card| card == nil }
    end

    true
  end

end

b = Board.new
pp b.grid
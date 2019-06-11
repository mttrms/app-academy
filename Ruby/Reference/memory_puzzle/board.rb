require_relative "card"

class Board
  attr_reader :grid
  def initialize
    @grid = create_grid(3)
    populate
    render
  end

  def create_grid(n)
    grid = Array.new(n + 1) { Array.new(n + 1) }
  end

  def cards
    ("A".."Z").to_a
  end

  def populate
    card = cards.sample
    cards_placed = 0

    until grid_full?
      row = rand(@grid.length)
      col = rand(@grid.length)

      if @grid[row][col] == nil
        @grid[row][col] = Card.new(card)
        cards_placed += 1
      end

      if cards_placed == 2
        card = cards.sample
        cards_placed = 0
      end

    end
  end

  def grid_full?
    @grid.each do |row|
      return false if row.any? { |card| card == nil }
    end

    true
  end
  
  def render
    @grid.each do |row|
      pretty_row = []
      row.each do |card|
        pretty_row << card.value
      end
      p pretty_row
    end
  end

  def won?
    @grid.each do |row|
      return false if row.any? { |card| card.face_up == false }
    end
  end
  
  true
end

play = Board.new
# pp b.grid
require_relative "card"

class Board
  attr_reader :grid, :render
  def initialize
    @grid = create_grid(3)
    populate
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
    puts `clear`

    puts "  0 1 2 3"
    @grid.each_with_index do |row, idx|
      pretty_row = [idx]
      row.each do |card|
        card.face_up ? pretty_row << card.value : pretty_row << " "
      end

      puts pretty_row.join(" ")
    end
  end

  def won?
    @grid.each do |row|
      return false if row.any? { |card| card.face_up == false }
    end
    puts "Congrats, you won!"
    render
  end
  
  true
end

play = Board.new
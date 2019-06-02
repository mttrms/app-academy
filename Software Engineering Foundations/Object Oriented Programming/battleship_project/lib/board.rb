class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](coords)
    row, col = coords
    @grid[row][col]
  end

  def []=(coords, value)
    row, col = coords
    @grid[row][col] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(coords)
    if self[coords] == :S
      self[coords] = :H
      puts "you sunk my battleship"
      true
    else
      self[coords] = :X
      false
    end
  end

  def place_random_ships
    until self.num_ships == (@size * 0.25)
      row = rand(@grid.count)
      col = rand(@grid.count)
      coords = [row, col]
      self[coords] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        ele == :S ? :N : ele
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end

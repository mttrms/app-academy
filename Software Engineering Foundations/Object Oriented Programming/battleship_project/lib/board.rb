class Board
  attr_reader :size

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
end

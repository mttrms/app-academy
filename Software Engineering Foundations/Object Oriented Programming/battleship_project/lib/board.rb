class Board
  attr_reader :size

  def initialize(num)
    @grid = []

    num.times do
      row = []
      num.times { row << :N } 
      @grid << row
    end

    @size = num * num
  end

  def [](coords)
    row = coords[0]
    col = coords[1]

    @grid[row][col]
  end

  def []=(coords, value)
    row = coords[0]
    col = coords[1]

    @grid[row][col] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end
end

require_relative 'tile'

class Board
  def initialize(size)
    @grid = create_grid(size)
    seed_bombs(@grid)
    render
  end

  def create_grid(size)
    Array.new(size) { Array.new(size) { Tile.new } }
  end

  def seed_bombs(grid)
    bomb_count = 0
    until bomb_count == 10
      row = rand(@grid.length)
      col = rand(@grid.length)
      pos = [row, col]

      if self[pos].bombed == false
        self[pos].place_bomb
        bomb_count += 1
      end

    end
  end

  def render
    @grid.each do |row|
      p row
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

end

b = Board.new(9)

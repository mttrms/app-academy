require_relative 'tile'

class Board
  def initialize(size)
    @grid = create_grid(size)
    seed_bombs(@grid)
    render
  end

  def create_grid(size)
    Array.new(size) { Array.new(size) }
  end

  def seed_bombs(grid)
    bomb_count = 0
    until bomb_count == 10
      row = rand(@grid.length)
      col = rand(@grid.length)

      if @grid[row][col] == nil
        tile = Tile.new
        tile.place_bomb
        @grid[row][col] = tile
        bomb_count += 1
      end

    end
  end

  def render
    @grid.each do |row|
      p row
    end
  end
end

b = Board.new(9)
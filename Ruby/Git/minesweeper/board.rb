class Board
  def initialize(size)
    @grid = create_grid(size)
    seed_bmbs(@grid)
  end

  def create_grid(size)
    Array.new(size) { Array.new(size) {"a"} }
  end

  def seed_bombs(grid)

  end
end

b = Board.new(9)
class ChessBoard
  attr_accessor :board
  def initialize(size)
    @size = size
    @board = []
    create
  end

  def create
    @size.times do
      row = []
      @size.times do
        row << " "
      end
    @board << row
    end
    
    @board
  end
end

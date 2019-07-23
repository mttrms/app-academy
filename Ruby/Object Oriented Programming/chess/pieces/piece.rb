class Piece
  attr_accessor :pos
  attr_reader :color, :symbol, :board, :valid_moves
  
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def to_s
    symbol
  end

  def valid_moves
    moves.select { |move| !move_into_check?(move) }
  end

  def move_into_check?(end_pos)
    duped_board = @board.dup
    duped_board.move_piece!(pos, end_pos)

    duped_board.in_check?(color)
  end

  def moves
  end
end
require_relative 'piece'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new (8) }
    @rows.each_with_index do |row, idx|
      row.map! { |square| Piece.new if STARTING_ROWS.include?(idx) }
    end
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new("There is no piece at #{start_pos}") if self[start_pos] == nil
    raise ArgumentError.new("This piece cannot move to #{end_pos}") if self[end_pos] != nil

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  STARTING_ROWS = [0, 1, 6, 7]
end

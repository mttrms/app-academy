require_relative 'piece'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new (8) }
    @rows.each_with_index do |row, idx|
      row.map! { |square| Piece.new if STARTING_ROWS.include?(idx) }
    end
  end

  STARTING_ROWS = [0, 1, 6, 7]
end

require_relative 'piece'
require_relative 'null_piece'

class Board
  attr_reader :rows

  # def initialize
  #   @rows = Array.new(8) { Array.new (8) }
  #   @rows.each_with_index do |row, row_idx|
  #     row.map!.with_index do |square, col_idx|
  #       if STARTING_ROWS.include?(row_idx)
  #         Piece.new([row_idx, col_idx], self) 
  #       else
  #         NullPiece.new
  #       end
  #     end
  #   end
  # end

  def initialize
    @rows = Array.new(8) { Array.new (8) { NullPiece.new }}
    @rows.each_with_index do |row, row_idx|
      color = :white if [0, 1].include?(row_idx)
      color = :black if [6, 7].include?(row_idx)

      if [1, 6].include?(row_idx)
        row.map!.with_index do |square, col_idx|
          Pawn.new(color, [row_idx, col_idx], self)
        end
      elsif [0, 7].include?(row_idx)
        
      end

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

require_relative 'piece'
require_relative 'null_piece'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new (8) { NullPiece.new }}
    @rows.each_with_index do |row, row_idx|

      if [1, 6].include?(row_idx)
        row.map!.with_index do |square, col_idx|
          add_piece(:pawn, [row_idx, col_idx])
        end
      elsif [0, 7].include?(row_idx)
        row.map!.with_index do |square, col_idx|
          square = [row_idx, col_idx]
          if [0, 7].include?(col_idx)
            add_piece(:rook, square)
          elsif [1, 6].include?(col_idx)
            add_piece(:knight, square)
          elsif [2, 5].include?(col_idx)
            add_piece(:bishop, square)
          elsif col_idx == 3
            add_piece(:queen, square)
          elsif col_idx == 4
            add_piece(:king, square)
          end
        end
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

  def add_piece(piece, pos)
    color = :white if [0, 1].include?(pos[0])
    color = :black if [6, 7].include?(pos[0])

    if piece == :rook
      Rook.new(pos, color, self)
    elsif piece == :pawn
      Pawn.new(pos, color, self)
    elsif piece == :knight
      Knight.new(pos, color, self)
    elsif piece == :queen
      Queen.new(pos, color, self)
    elsif piece == :bishop
      Bishop.new(pos, color, self)
    elsif piece == :king
      King.new(pos, color, self)
    end
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError.new("There is no piece at #{start_pos}") if self[start_pos] == nil
    raise ArgumentError.new("This piece cannot move to #{end_pos}") if self[end_pos] != nil

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end
end

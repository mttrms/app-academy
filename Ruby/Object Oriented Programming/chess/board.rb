require_relative 'pieces'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new (8) { NullPiece.instance }}
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
    return nil unless valid_pos?(pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, val)
    return nil unless valid_pos?(pos)
    row, col = pos
    rows[row][col] = val
  end

  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def add_piece(color = nil, piece, pos)
    if color == nil
      color = :white if [0, 1].include?(pos[0])
      color = :black if [6, 7].include?(pos[0])
    end

    if piece == :rook
      Rook.new(color, pos, self)
    elsif piece == :pawn
      Pawn.new(color, pos, self)
    elsif piece == :knight
      Knight.new(color, pos, self)
    elsif piece == :queen
      Queen.new(color, pos, self)
    elsif piece == :bishop
      Bishop.new(color, pos, self)
    elsif piece == :king
      King.new(color, pos, self)
    end
  end

  def move_piece(turn_color, start_pos, end_pos)
    piece = self[start_pos]
    raise "Start position is empty." if piece.class == NullPiece
    
    if piece.color != turn_color
      raise "You must move your own piece."
    elsif !piece.moves.include?(end_pos)
      raise "Piece does not move like that."
    elsif !piece.valid_moves.include?(end_pos)
      raise "You cannot move into / remain in check."
    end

    move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = NullPiece.instance
  end

  def in_check?(color)
    king_pos = find_king(color)
    
    pieces.each do |piece|
      next unless piece.class != NullPiece && piece.color != color
      return true if piece.moves.any? { |move| move == king_pos }
    end

    false
  end

  def find_king(color)
    pieces(color).each do |piece|
      return piece.pos if piece.class == King
    end

    nil
  end

  def checkmate?(color)
    return false unless in_check?(color)

    pieces.none? do |piece|
      next if piece.class == NullPiece || piece.color != color
      piece.valid_moves.any?
    end

  end

  def dup
    duped_board = Board.new
    (0..7).each do |i|
      (0..7).each do |j|
        if self[[i, j]].class == NullPiece
          duped_board[[i, j]] = NullPiece.instance
        else
          piece = self[[i, j]]
          duped_board[[i, j]] = duped_board.add_piece(piece.color, piece.class.to_s.downcase.to_sym, [i, j])
        end
      end
    end
    
    duped_board
  end

  def pieces(color = nil)
    all_pieces = []
    (0..7).each do |i|
      (0..7).each do |j|
        if color == nil
          all_pieces << self[[i, j]]
        else
          all_pieces << self[[i, j]] if self[[i, j]].color == color
        end
      end
    end

    all_pieces
  end
end

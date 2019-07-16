require_relative 'piece'

class Rook < Piece
  include Slideable

  def move_dirs
    ["horizontal"]
  end
end
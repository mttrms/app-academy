require_relative 'piece'

class Rook < Piece
  include Slideable
  
  def move_dirs
    ["vertical", "horizontal"]
  end
end
require 'colorize'
require_relative 'cursor'

class Display
  def initialize(board)
    @board = board
    @cursor to Cursor.new([0,0], @board)
  end

  def render
  end
end
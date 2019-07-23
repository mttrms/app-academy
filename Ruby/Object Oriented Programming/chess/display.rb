require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    print `clear`
    @board.rows.each.with_index do |row, i|
      row.each.with_index do |square, j|
        background_color = (:yellow if [i, j] == @cursor.cursor_pos) || set_background([i, j])
        print " #{square.to_s} ".colorize(:color => square.color, :background => background_color)
      end
      puts "\n"
    end
  end

  def set_background(pos)
    row, col = pos
    return :light_black if row % 2 == col % 2
    
    :light_blue
  end
end
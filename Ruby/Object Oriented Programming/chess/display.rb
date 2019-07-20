require 'colorize'
require_relative 'cursor'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    print `clear`
    @board.rows.each.with_index do |row, i|
      row.each.with_index do |square, j|
        background_color = set_background([i, j])
        if [i, j] == @cursor.cursor_pos
          print " X "
        else
          print " #{square.to_s} ".colorize(:color => square.color, :background => background_color)
        end
      end
      puts "\n"
    end
    @cursor.get_input
  end

  def set_background(pos)
    row, col = pos
    return :red if row % 2 == col % 2
    
    :light_cyan
  end
end
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
        if [i, j] == @cursor.cursor_pos
          print "X"
        else
          print " #{square.to_s} ".colorize(:color => square.color, :background => :light_blue)
        end
      end
      puts ""
    end
    @cursor.get_input

    nil
  end
end
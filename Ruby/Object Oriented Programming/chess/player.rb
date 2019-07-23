class Player
  def initialize(color, display)
    @color = color
    @display = display
  end

  def make_move
    start_pos = nil
    end_pos = nil

    until start_pos && end_pos
      @display.render
      if start_pos
        puts "Move to?"
        end_pos = @display.cursor.get_input
      else
        puts "#{@color}: Select a piece to move"
        start_pos = @display.cursor.get_input
      end
    end

    [start_pos, end_pos]
  end
end
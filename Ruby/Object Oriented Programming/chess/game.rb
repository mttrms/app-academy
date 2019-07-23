require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      :white => Player.new(:white, @display),
      :black => Player.new(:black, @display)
    }
    @current_player = :white
  end

  def play
    # puts @players[@current_player]
    # p @current_player
    until @board.checkmate?(@current_player)
      start_pos, end_pos = @players[@current_player].make_move
      @board.move_piece(start_pos, end_pos)
      swap_turn!
    end
  end

  private

  def swap_turn!
    @current_player == :white ? @current_player = :black : @current_player = :white
  end
end
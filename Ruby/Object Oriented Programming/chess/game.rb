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
    until @board.checkmate?(@current_player)
      begin
      start_pos, end_pos = @players[@current_player].make_move
      # next if @board[start_pos].color != @current_player
      @board.move_piece(@current_player, start_pos, end_pos)
      rescue StandardError => e
        puts "#{e.message} Try again."
        sleep 2.5
        retry
      end
      swap_turn!
      # debugger
      @board.in_check?(@current_player) ? @display.in_check(true) : @display.in_check(false)
    end

    @display.render
    puts "GG. #{@current_player} loses."
  end

  private

  def swap_turn!
    @current_player == :white ? @current_player = :black : @current_player = :white
  end
end
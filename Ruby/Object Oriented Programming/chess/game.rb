class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      :white = Player.new(:white, @display),
      :black = Player.new(:black, @display)
    }
    @current_player = :white
  end
end
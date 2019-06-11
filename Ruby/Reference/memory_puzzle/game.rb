require_relative "board"
require_relative "card"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @previous_guess
  end

  def play
    @board.render
    puts "Make a guess"
    prompt
  end

  def prompt
    guessed_position = gets.chomp
    p guessed_position # make_guess(guessed_position)
    
  end

  def make_guess(position)
    
  end
end
require_relative "board"
require_relative "card"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @previous_guess
    @current_guess
  end

  def play
    @board.render
    prompt
  end

  def prompt
    puts "Make a guess"
    guessed_position = gets.chomp.split(",").join("")
    make_guess(guessed_position)
  end

  def make_guess(position)
    row = position[0].to_i
    col = position[1].to_i
    
    if !@previous_guess
      @previous_guess = @board.grid[row][col]
      @previous_guess.reveal
    else
      @current_guess = @board.grid[row][col]
      @current_guess.reveal
    end

    if @current_guess != nil
      if @previous_guess.value == @current_guess.value
        @previous_guess, @current_guess = nil, nil
      else
        @board.render
        puts "Sorry, wrong answer!"
        sleep(1)
        @previous_guess.hide
        @current_guess.hide
        @previous_guess, @current_guess = nil, nil
      end
    end
  end
end
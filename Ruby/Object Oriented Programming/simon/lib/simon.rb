require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)
  COLORED_TEXT = {
    "red" => :red,
    "blue" => :light_cyan,
    "green" => :light_green,
    "yellow" => :light_yellow
  }

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @seq = []
    @sequence_length = 1
  end

  def play
    take_turn until game_over

    if game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence
    
    if !game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    
    
    @seq.each do |color|
      print `clear`
      puts "Remember me:"
      sleep 0.3
      puts "#{color}".colorize(COLORED_TEXT[color])
      sleep 0.3
      print `clear`
    end
    
  end

  def require_sequence
    puts "Guess the sequence. Example: GBYBBGR"
    guess = gets.chomp

    clean_guess = guess.split("").map do |char|
      if char.downcase == "r"
        "red"
      elsif char.downcase == "b"
        "blue"
      elsif char.downcase == "g"
        "green"
      elsif char.downcase == "y"
        "yellow"
    end
  end

  @game_over = true if @seq != clean_guess
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Round won!"
    sleep 0.5
  end

  def game_over_message
    puts "You lose!"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
    nil
  end
end

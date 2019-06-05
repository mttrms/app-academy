require 'set'
require_relative "player"

class Game
  attr_accessor :current_player, :previous_player

  def initialize
    @player_1 = Player.new("Matt")
    @player_2 = Player.new("Other Person")
    @dictionary = build_wordlist
    @fragment = ""
    @losses = {}
    @current_player = @player_1
  end

  def build_wordlist
    wordlist = Set.new
    
    File.foreach(File.dirname(__FILE__) + '/dictionary.txt') do |word|
      wordlist << word.chomp
    end

    wordlist
  end

  def play_round

  end

  def next_player!
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end
  
  

  def take_turn(player)
    puts "Make your guess"
    char = gets.chomp
    player_guess = @fragment + char
    
    if valid_play?(player_guess) && char.length == 1
      @fragment += char
      p "The new fragment is #{@fragment}"
      take_turn(next_player!)
    else
      puts "you lose"
    end
    


  end

  def valid_play?(guess)
    @dictionary.each do |word|
      if word == guess
        puts "#{guess} is a word!"
        return false
      elsif word.include?(guess)
        return true
      end
    end

    false
  end
end


my_game = Game.new

my_game.build_wordlist

# my_game.previous_player = "hi"
p my_game.valid_play?("")


my_game.take_turn(my_game.current_player.name)


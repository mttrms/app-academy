require 'set'
require_relative "player"

class Game
  attr_accessor :current_player, :previous_player

  def initialize
    @player_1 = Player.new("Matt")
    @player_2 = Player.new("Other Person")
    @dictionary = build_wordlist
    @fragment = ""
    @losses = Hash.new(0)
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
    take_turn(current_player)
    next_player!
  end

  def run
    until @losses.values.max == 5 do
      play_round
    end
    
  end

  def next_player!
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end
  
  def take_turn(player)
    puts "Make your guess #{player.name}, current fragment is '#{@fragment}'"
    char = gets.chomp

    if valid_play?(char)
      @fragment += char
    else
      puts "invalid, your guess was #{char}, the fragment is #{@fragment}"
      take_turn(@current_player)
    end

    if @dictionary.include?(@fragment)
      @losses[player] += 1
      @fragment = ""
      puts "#{player.name} loses. Their loss count is: #{@losses[player]}"
    end

    false
  end

  def valid_play?(char)
    return false if char.length > 1
    guess = @fragment + char

    @dictionary.each do |word|
      if word.include?(guess)
        return true
      end
    end

    false
  end
end


my_game = Game.new
my_game.build_wordlist
my_game.run

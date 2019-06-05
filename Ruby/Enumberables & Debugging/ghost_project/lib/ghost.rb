require 'set'
require_relative "player"

class Game
  attr_accessor :current_player, :previous_player

  def initialize (*players)
    @players = []
    @dictionary = build_wordlist
    @fragment = ""
    @losses = Hash.new(0)
    
    players.each do |name|
      @players << Player.new(name)
    end

    @active_players = @players.dup
    @current_player = @active_players[0]
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
    until @active_players.length == 1 do
      play_round
      @active_players.each do |player|
        if @losses[player] == 2
          puts "#{player.name} has been eliminated from the game with 5 losses."
          @active_players.delete(player)
        end
      end
    end
    
    puts "#{@current_player.name} wins!"
  end

  def next_player!
    current_player_idx = @active_players.index(@current_player)
    @current_player = @active_players[(current_player_idx + 1) % @active_players.length]
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


my_game = Game.new("Matt", "Other Player", "Third Player")
my_game.build_wordlist
my_game.run

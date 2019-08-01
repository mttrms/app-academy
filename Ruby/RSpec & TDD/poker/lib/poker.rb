require_relative 'deck'
require_relative 'player'

class Poker
  attr_reader :deck, :players, :pot

  def initialize
    @deck = Deck.new
    @players = []
    @pot = 0
  end

  def play
    play_round until game_over?
  end

  def play_round
    deck.shuffle!
    reset_players
    deal_cards
    prompt_players
    trade_cards
    prompt_players
    p end_round
  end

  def add_players(n)
    n.times do
      @players << Player.new
    end
  end

  def reset_players
    @players.each do |player|
      player.unfold
    end
  end

  def deal_cards
    @players.each do |player|
      cards = @deck.deal(5)
      player.deal(cards)
    end
  end

  def prompt_players
    @players.each { |player| player.reset_bet }
    high_bet = 0
    no_raises = false
    most_recent_better = nil

    until no_raises
      no_raises = true
      @players.each_with_index do |player, i|
        next if player.folded?
        break if most_recent_better == player || round_over?

        render(i, high_bet)
        player_response = player.prompt

        if player_response == "C"
          player.bet(high_bet)
          increase_pot(high_bet)
        elsif player_response == "B"
          no_raises = false
          most_recent_better = player
          puts "how much would you like to bet?"
          amount = gets.chomp.to_i
          player.bet(amount)
          increase_pot(amount)
          high_bet = amount
        elsif player_response == "F"
          player.fold
        end
      end
    end
  end

  def trade_cards
    @players.each.with_index do |player, idx|
      puts "Player #{idx}: which cards would you like to trade?"
      puts "#{player.hand.to_s}"
      traded_cards = player.trade_cards
    end
  end

  def render(player_idx, high_bet)
    puts
    puts "Pot: $#{@pot}"
    puts "High bet: $#{high_bet}"

    @players.each_with_index do |player, i|
      puts "Player #{i} has $#{player.money}"
    end

    puts
    puts "Current player: Player #{player_idx}"
    puts "Player #{player_idx} has bet: $#{@players[player_idx].current_bet}"
    puts "Player #{player_idx} hand: #{@players[player_idx].hand.to_s}"
  end

  def end_round
    active_hands = Hash.new
    winner = nil

    @players.each_with_index do |player, i|
      next if player.folded?
      active_hands[player] = player.hand
    end

    active_hands.each do |player, hand|
      if winner == nil
        winner = hand 
        next
      end

      Hand.winner(winner, hand) == active_hands[winner] ? winner : winner = hand
    end

    @players.each_with_index do |player, i|
      if player.hand == winner
        puts "Player #{i} wins!"
        puts player.hand.play
      end
    end

    nil
  end

  def increase_pot(n)
    @pot += n
  end

  def round_over?
    @players.count { |player| !player.folded? } <= 1
  end

  def game_over?
    @players.one? { |player| player.money != 0 }
  end
end

require_relative 'deck'
require_relative 'player'

class Poker
  attr_reader :deck, :players, :pot

  def initialize
    @deck = Deck.new
    @players = []
    @pot = 0
  end

  def add_players(n)
    n.times do
      @players << Player.new
    end
  end

  def deal_cards
    @players.each do |player|
      cards = @deck.deal(5)
      player.deal(cards)
    end
  end

  def increase_pot(n)
    @pot += n
  end

  def game_over?
    @players.one? { |player| player.money != 0 }
  end
end

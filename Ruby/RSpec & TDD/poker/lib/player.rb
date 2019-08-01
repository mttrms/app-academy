require_relative 'hand'

class Player
  attr_reader :name, :hand, :money, :folded, :current_bet

  def initialize
    @hand = Hand.new
    @money = 500
    @current_bet = 0
    @folded = false
  end

  def bet(amount)
    raise ArgumentError("not enough money") if amount > @money
    @money -= amount
    @current_bet = amount
    
    amount
  end

  def prompt
    puts "Respond C to call, B to bet, F to fold"
    action = gets.chomp.upcase

    action
  end

  def fold
    @folded = true
  end

  def unfold
    @folded = false
  end

  def folded?
    @folded
  end

  def reset_bet
    @current_bet = 0
  end

  def give_cards
    @hand = nil
  end

  def deal(cards)
    raise ArgumentError, "must be an array" unless cards.class == Array
    @hand = Hand.new(cards)
  end

  def pay(amount)
    @money += amount

    amount
  end

  def trade_cards
    puts "Trade up to 3 cards (1,3,4)"
    traded_cards = gets.chomp.delete(' ').split(',').map(&:to_i).map { |idx| idx -= 1 }
    raise ArgumentError, "Must trade 0-3 cards" if traded_cards.length > 3

    traded_cards
  end
end


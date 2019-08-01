class Player
  attr_reader :name, :hand, :money, :folded

  def initialize
    @hand = Hand.new
    @money = 500
    @folded = false
  end

  def bet(amount)
    raise ArgumentError("not enough money") if amount > @money
    @money -= amount
    
    amount
  end

  def fold
    @folded = true
  end

  def unfold
    @folded = false
  end

  def give_cards
    @hand = nil
  end

  def deal(hand)
    raise ArgumentError, "must be a hand" unless hand.class == Hand
    @hand = hand
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


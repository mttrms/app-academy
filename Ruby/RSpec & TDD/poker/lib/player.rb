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
    raise ArgumentError("must be a hand") unless hand.class == Hand
    @hand = hand
  end

  def pay(amount)
    @money += amount

    amount
  end
end


class Hand
  def initialize(cards)
    raise ArgumentError, "Hands must contain 5 cards" unless cards.length == 5
    @cards = cards
  end
  
  def self.calculate(hand)
  end

  private

  def is_straight_flush?(hand)
  end
end

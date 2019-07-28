class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    raise "invalid value" unless CARD_VALUES.include?(value)
    raise "invalid suit" unless CARD_SUITS.include?(suit)

    @value = value
    @suit = suit
  end

  CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
  CARD_SUITS = ["D", "C", "H", "S"]
end

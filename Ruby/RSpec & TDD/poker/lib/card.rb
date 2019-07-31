class Card
  attr_reader :value, :suit, :rank

  def initialize(value, suit)
    raise "invalid value" unless CARD_VALUES.include?(value)
    raise "invalid suit" unless CARD_SUITS.include?(suit)

    @value = value
    @suit = suit
    @rank = CARD_RANKS[value]
  end

  CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
  CARD_SUITS = ["D", "C", "H", "S"]
  CARD_RANKS = {
    2 => 1,
    3 => 2,
    4 => 3,
    5 => 4,
    6 => 5,
    7 => 6,
    8 => 7,
    9 => 8,
    10 => 9,
    "J" => 10,
    "Q" => 11,
    "K" => 12,
    "A" => 13
  }
end

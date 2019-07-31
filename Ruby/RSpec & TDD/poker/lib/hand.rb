class Hand
  def initialize(cards)
    raise ArgumentError, "Hands must contain 5 cards" unless cards.length == 5
    @cards = Hand.card_hash(cards)
  end
  
  def calculate
  end

  def is_straight_flush?
  end

  def one_pair?
    @cards.keys.any? { |card| @cards[card].length == 2 }
  end

  def two_pairs?
    @cards.keys.count { |card| @cards[card].length == 2 } == 2 
  end

  def three_of_a_kind?
    @cards.keys.any? { |card| @cards[card].length == 3 } 
  end

  def self.card_hash(hand)
    card_hash = Hash.new { |h,k| h[k] = Array.new }
    hand.each do |card|
      card_hash[card.value] << card
    end

    card_hash
  end
end

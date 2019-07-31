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

  def four_of_a_kind?
    @cards.keys.any? { |card| @cards[card].length == 4 }
  end

  def straight?
    card_ranks = @cards.values.flatten.map { |card| card.rank }
    straight = card_ranks.sort.each_cons(2).all? { |i, j| j == i + 1 }
    return straight if straight == true || !@cards.key?("A")

    # Map Ace to low, sort, check for Ace-low straight
    card_ranks.map! { |value| value == 13 ? 0 : value }
    card_ranks.sort.each_cons(2).all? { |i, j| j == i + 1 }
  end

  def self.card_hash(hand)
    card_hash = Hash.new { |h,k| h[k] = Array.new }
    hand.each do |card|
      card_hash[card.value] << card
    end

    card_hash
  end
end

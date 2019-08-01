class Hand
  def initialize(cards = [])
    raise ArgumentError, "Hands must contain 0-5 cards" if cards.length > 5
    @cards = Hand.card_hash(cards)
  end

  def to_s
    @cards.values.flatten.map { |card| [card.value, card.suit] }
  end

  def add(card)
    @cards[card.value] << card
  end

  def discard(card)
    @cards[card.value].delete(card)
  end
  
  def playable_hands
    hands = {
      :straight_flush => straight && flush,
      :four_of_a_kind => four_of_a_kind,
      :full_house => one_pair && three_of_a_kind,
      :flush => flush,
      :straight => straight,
      :three_of_a_kind => three_of_a_kind,
      :two_pairs => two_pairs,
      :one_pair => one_pair,
      :high_card => high_card
    }
  end

  def play
    playable_hands.each do |hand, playable|
      return hand if playable
    end
  end

  def high_card
    @cards.values.flatten.reduce { |best_card, card| card.rank > best_card.rank ? card : best_card }
  end

  def one_pair
    if @cards.keys.one? { |card| @cards[card].length == 2 }
      @cards.each do |card_value, cards|
        return cards if @cards[card_value].length == 2
      end
    end

    false
  end

  def two_pairs
    if @cards.keys.count { |card| @cards[card].length == 2 } == 2 
      two_pairs = Array.new

      @cards.each do |card_value, cards|
        two_pairs += cards if @cards[card_value].length == 2
      end

      return two_pairs
    end

    false
  end

  def three_of_a_kind
    if @cards.keys.any? { |card| @cards[card].length == 3 } 
      three_pairs = Array.new

      @cards.each do |card_value, cards|
        three_pairs += cards if @cards[card_value].length == 3
      end

      return three_pairs
    end

    false
  end

  def four_of_a_kind
    if @cards.keys.any? { |card| @cards[card].length == 4 }
      four_pairs = Array.new

      @cards.each do |card_value, cards|
        four_pairs += cards if @cards[card_value].length == 4
      end

      return four_pairs
    end

    false
  end

  def straight
    card_ranks = @cards.values.flatten.map { |card| card.rank }
    straight = card_ranks.sort.each_cons(2).all? { |i, j| j == i + 1 }

    if straight == true
      return @cards.values.flatten.sort_by(&:rank)
    end

    # Map Ace to low, sort, check for Ace-low straight
    card_ranks.map! { |value| value == 13 ? 0 : value }
    straight = card_ranks.sort.each_cons(2).all? { |i, j| j == i + 1 }

    if straight == true
      # Reorder cards and put ace in the front, since it's an ace-low straight
      unsorted_cards = @cards.values.flatten.sort_by(&:rank)
      unsorted_cards.unshift(unsorted_cards.pop)
      return unsorted_cards
    end

    false
  end

  def flush
    card_suits = @cards.values.flatten.map { |card| card.suit }
    card_suits.uniq.size <= 1 ? @cards.values.flatten : false
  end

  def self.card_hash(hand)
    card_hash = Hash.new { |h,k| h[k] = Array.new }
    hand.each do |card|
      card_hash[card.value] << card
    end

    card_hash
  end

  def self.winner(hand1, hand2)
    if HAND_RANKINGS[hand1.play] > HAND_RANKINGS[hand2.play]
      hand1
    elsif HAND_RANKINGS[hand1.play] < HAND_RANKINGS[hand2.play]
      hand2
    elsif HAND_RANKINGS[hand1.play] == HAND_RANKINGS[hand2.play]
      if hand1.play == :full_house
        hand1.playable_hands[:three_of_a_kind].first.rank > hand2.playable_hands[:three_of_a_kind].first.rank ? hand1 : hand2
      elsif hand1.play == :high_card
        hand1.playable_hands[hand1.play].rank > hand2.playable_hands[hand2.play].rank ? hand1 : hand2
      else
        hand1_high = hand1.playable_hands[hand1.play].sort_by(&:rank).last
        hand2_high = hand2.playable_hands[hand2.play].sort_by(&:rank).last

        hand1_high.rank > hand2_high.rank ? hand1 : hand2
      end
    end
  end

  HAND_RANKINGS = {
    :straight_flush => 8,
    :four_of_a_kind => 7,
    :full_house => 6,
    :flush => 5,
    :straight => 4,
    :three_of_a_kind => 3,
    :two_pairs => 2,
    :one_pair => 1,
    :high_card => 0
  }
end

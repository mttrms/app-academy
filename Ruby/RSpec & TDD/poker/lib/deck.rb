require_relative 'card'

class Deck
  def initialize
    @cards = Deck.cards
    shuffle
  end

  def count
    @cards.count
  end

  def shuffle
    shuffled_cards = Array.new
    card_indices = (0...@cards.length).to_a

    until card_indices.empty? do
      i = card_indices.sample
      shuffled_cards << @cards[i]
      card_indices.delete(i)
    end
    
    duplicate_deck?(shuffled_cards, @cards) ? shuffle : shuffled_cards
  end

  def shuffle!
    @cards = shuffle
  end

  def take
    @cards.pop
  end

  def deal(amount)
    dealt_cards = Array.new
    amount.times { dealt_cards << take }

    dealt_cards
  end

  def inspect
    "A deck of playing cards"
  end

  def self.cards
    all_cards = Array.new

    values = Card::CARD_VALUES
    suits = Card::CARD_SUITS

    values.each do |value|
      suits.each do |suit|
        all_cards << Card.new(value, suit)
      end
    end

    all_cards
  end

  private
  
  def duplicate_deck?(deck1, deck2)
    deck1_values = deck1.map { |card| [card.value, card.suit] }
    deck2_values = deck2.map { |card| [card.value, card.suit] }

    deck1_values == deck2_values
  end
end

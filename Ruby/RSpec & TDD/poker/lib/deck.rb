require_relative 'card'

class Deck
  def initialize
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
end

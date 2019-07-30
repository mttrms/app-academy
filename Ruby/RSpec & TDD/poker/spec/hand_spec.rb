require 'hand'

describe "Hand" do
  card1 = Card.new(10, "H")
  card2 = Card.new(10, "D")
  card3 = Card.new(2, "C")
  card4 = Card.new(5, "S")
  card5 = Card.new("Q", "S")
  card6 = Card.new(4, "D")
  dealt_cards = [card1, card2, card3, card4, card5]

  subject(:hand) { Hand.new(dealt_cards) }
  let(:cards) { hand.instance_variable_get(:@cards) }

  describe "#initialize" do
    it "initializes with an array of cards" do
      expect(cards).to eq(dealt_cards)
    end

    it "is hidden" do
      expect { hand.cards }.to raise_error(NoMethodError)
    end

    it "only accepts 5 cards" do
      dealt_cards << card6
      expect { Hand.new(dealt_cards) }.to raise_error(ArgumentError)

      # remove the extra card
      dealt_cards.pop
    end
  end

  describe "Hand::calculate" do
    hands = [:straight_flush, :four_of_a_kind, :full_house, :flush, :straight, :three_of_a_kind, :two_pair, :one_pair]

    it "returns a symbol representing a hand's rank" do
      expect(hands).to include(Hand.calculate(dealt_cards))
    end

    it "returns the high card when no better hands are found" do
      high_card_hand = Hand.new([card2, card3, card4, card5, card6])
      expect(Hand.calculate(high_card_hand)).to be(card5)
    end
  end
end

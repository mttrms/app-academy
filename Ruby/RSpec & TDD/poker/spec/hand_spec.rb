require 'hand'

describe "Hand" do
  card1 = Card.new(10, "H")
  card2 = Card.new("A", "D")
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
end

require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe "Deck::Cards" do
    let(:cards) { Deck.cards}

    it "creates 52 cards" do
      expect(cards.length).to eq(52)
    end

    it "contains only unique cards" do
      expect(cards.uniq { |card| [card.value, card.suit] }.count).to eq(52)
    end
  end

  describe "#initialize" do
    it "says how many cards it has" 

    it "calls shuffle"

    it "cannot be viewed"
  end


  describe "#shuffle" do
  end

  describe "#take" do
  end

  describe "#deal" do
  end
end

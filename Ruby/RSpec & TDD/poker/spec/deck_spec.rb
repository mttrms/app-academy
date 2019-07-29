require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "says how many cards it has" do
      expect(deck.count).to eq(52)
    end

    it "contains 52 unique cards" do
      expect(deck.uniq { |card| [card.value, card.suit] }.count).to eq(52)
    end
  end

  describe "#shuffle" do
  end

  describe "#take" do
  end

  describe "#deal" do
  end

end

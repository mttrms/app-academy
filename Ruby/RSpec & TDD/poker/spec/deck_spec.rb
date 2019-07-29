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
    it "calls Deck.cards" do
      expect(Deck).to receive(:cards)
      Deck.new
    end

    it "says how many cards it has" do
      expect(deck.count).to eq(52)
    end

    it "calls #shuffle" do
    end

    it "cannot be viewed" do
      expect(deck.inspect).to eq('A deck of playing cards')
    end
  end


  describe "#shuffle" do
  end

  describe "#take" do
    it "returns a card" do
      expect(deck.take).to be_an_instance_of(Card)
    end

    it "returns the top card on the pile" do
      card_1 = Card.new(10, "H")
      card_2 = Card.new("J", "S")
      card_3 = Card.new("A", "D")

      deck.instance_variable_set(:@cards, [card_1, card_3, card_2])

      expect(deck.take).to be(card_2)
    end
    
    it "removes the card from the deck" do
      deck.take
      expect(deck.count).to eq(51)
    end
  end

  describe "#deal" do
  end
end

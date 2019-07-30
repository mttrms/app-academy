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
    it "creates 52 cards" do
      expect(deck.count).to eq(52)
    end

    it "cannot be viewed" do
      expect(deck.inspect).to eq('A deck of playing cards')
    end
  end

  describe "#shuffle" do
    let(:cards) { deck.instance_variable_get(:@cards) }

    before(:each) do
      card_1 = Card.new(10, "H")
      card_2 = Card.new("J", "S")
      card_3 = Card.new("A", "D")
      deck.instance_variable_set(:@cards, [card_1, card_2, card_3])
    end

    it "returns a new Array" do
      expect(deck.shuffle).not_to be(cards)
    end

    it "returns the same cards" do
      expect(deck.shuffle.all? { |card| cards.include?(card) })
    end

    it "randomizes the order of the cards" do
      non_shuffled = cards.map { |card| [card.value, card.suit] }
      shuffled = deck.shuffle.map { |card| [card.value, card.suit] }

      expect(shuffled).not_to eq(non_shuffled)
    end
  end

  describe "#shuffle!" do
    let(:cards) { deck.instance_variable_get(:@cards) }

    it "shuffles the cards" do
      original_order = cards.dup
      expect(deck.shuffle!).not_to eq(original_order)
    end

    it "returns @cards" do
      expect(deck.shuffle!).to be(cards)
    end
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
    it "deals a hand" do
      card_1 = Card.new(10, "H")
      card_2 = Card.new("J", "S")
      card_3 = Card.new("A", "D")
      deck.instance_variable_set(:@cards, [card_1, card_3, card_2])

      expect(deck.deal(2)).to eq([card_2, card_3])
    end

    it "removes dealt cards from the deck" do
      deck.deal(2)
      expect(deck.count).to eq(50)
    end
  end
end

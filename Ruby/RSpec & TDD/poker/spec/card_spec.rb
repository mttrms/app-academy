require 'card'

describe Card do
  subject(:card) { Card.new(10, "C") } 

  describe "#initialize" do
    it "should accept a value and suit" do
      expect { Card.new("J", "H") }.not_to raise_error 
    end

    it "should raise an error with invalid value" do
      expect { Card.new(11, "C") }.to raise_error("invalid value")
    end

    it "should raise an error with invalid suit" do
      expect { Card.new("K", "P") }.to raise_error("invalid suit")
    end

    it "should make the card value readable" do
      expect(card.value).to eq(10)
    end

    it "should make the card suit readable" do
      expect(card.suit).to eq("C")
    end

    it "should rank the card" do
      expect(card.rank).to eq(9)
    end
  end
end

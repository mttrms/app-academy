require 'player'

describe "Player" do
  subject(:player) { Player.new }

  it "has money when created" do
    expect(player.money).to eq(500)
  end

  it "has a hand" do
    expect(player.hand).to be_a(Hand)
  end

  describe "#bet" do
    it "should decrease the player's money by the bet amount" do
      player.bet(10)
      expect(player.money).to eq(490)
    end
  end

  describe "#fold" do
    it "should set the player to folded" do
      player.fold
      expect(player.folded).to be true
    end
  end

  describe "#unfold" do
    it "should set the player as not folded" do
      player.fold
      player.unfold
      expect(player.folded).to be false
    end
  end

  describe "#give_cards" do
    it "should set the player's hand to nil" do
      player.give_cards
      expect(player.hand).to be_nil
    end
  end

  describe "#deal" do
    it "should set the player's hand" do
      player.instance_variable_set(:@hand, nil)
      cards = []
      player.deal(cards)
      expect(player.hand).to be_a(Hand)
    end
  end

  describe "#pay" do
    it "should increase the player's money by the payment amount" do
      player.pay(100)
      expect(player.money).to eq(600)
    end
  end
end

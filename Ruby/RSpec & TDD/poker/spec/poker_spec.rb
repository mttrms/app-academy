require 'poker'

describe "Poker" do
  subject(:poker) { Poker.new }

  describe "#initialize" do
    it "should have a Deck" do
      expect(poker.deck).to be_a(Deck)
    end

    it "should have a pot" do
      expect(poker.pot).to eq(0)
    end

    it "should have an array of players" do
      expect(poker.players).to be_empty
    end
  end

  describe "#add_players" do
    it "should add players to the current game" do
      poker.add_players(4)
      expect(poker.players.count).to eq(4)
    end
  end

  describe "#deal_cards" do
    it "should deal a hand to each player" do
      player1 = double("player1")
      player2 = double("player2")
      poker.add_players(2)
      poker.instance_variable_set(:@players, [player1, player2])
      expect(player1).to receive(:deal)
      expect(player2).to receive(:deal)

      poker.deal_cards
    end
  end

  describe "#game_over?" do
    it "returns false when all players have money" do
      poker.add_players(2)
      expect(poker.game_over?).to be false
    end

    it "returns true when only 1 player has money" do
      poker.add_players(3)
      poker.players[0].bet(500)
      poker.players[1].bet(500)
      expect(poker.game_over?).to be true
    end
  end

  describe "#increase_pot" do
    it "increases the pot by the amount given" do
      poker.increase_pot(50)
      poker.increase_pot(100)
      expect(poker.pot).to eq(150)
    end
  end
end

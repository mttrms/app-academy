require 'player'

describe "Player" do
  subject(:player) { Player.new("Matt") }

  it "has a name" do
    expect(player.name).to eq("Matt")
  end

  it "has money when created" do
    expect(player.money).to eq(500)
  end

  it "has a hand" do
    expect(player.hand).to be_a(Hand)
  end
end

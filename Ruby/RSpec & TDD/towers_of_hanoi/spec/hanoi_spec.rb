require 'hanoi'

describe Tower do
  subject(:tower) { Tower.new }

  describe "#initialize" do
    it "has 3 columns" do
      expect(tower.columns.length).to eq(3)
    end
    it "starts discs at position 0" do
      expect(tower.columns).to eq([[5,4,3,2,1], [], []])
    end
  end

  describe "#move_disc" do
    it "is a valid method" do
      expect(tower).to respond_to(:move_disc)
    end

    it "accepts a start and end index" do
      expect { tower.move_disc(0,2) }.not_to raise_error
    end

    it "removes the disc from the top of the  start position" do
      tower.move_disc(0,2)
      expect(tower.columns[0]).to eq([5,4,3,2])
    end

    it "places the disc on top of the end position" do
      tower.move_disc(0,2)
      tower.move_disc(0,2) 
      expect(tower.columns[2]).to eq([1, 2])
    end

    it "raises an error when the start position is empty" do
      expect { tower.move_disc(1, 2) }.to raise_error("start pos is empty")
    end

    it "raises an error when placing the disc on itself" do
      expect { tower.move_disc(0,0) }.to raise_error("disc must move")
    end
  end

  describe "#won?" do
    it "is a valid method" do
      expect(tower).to respond_to(:won?)
    end

    it "returns false when the game hasn't been won" do
      expect(tower.won?).to be false 
    end

    it "returns true when the discs have been moved" do
      tower.instance_variable_set(:@columns, [[], [], [5,4,3,2,1]])
      expect(tower.won?).to be true
    end
  end
end 

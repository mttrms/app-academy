# Subject & Let

# `subject` and `it` – May want to instantiate an instance of the object to test it out
# Define a `subject` for those tests.

describe Robot do
  subject { Robot.new }

  it "satisfies some expectation" do
    expect(subject).to # ...
  end
end

# can also declare subject with a name

describe Robot do
  subject(:robot) { Robot.new }

  it "position should start at [0, 0]" do
    expect(robot.position).to eq([0,0])
  end

  describe "move methods" do
    it "moves left" do
      robot.move_left
      expect(robot.position).to eq([-1, 0])
    end
  end
end

# `subject` also accepts a block that constructs the subject.

# Let
# `subject` lets us define the subject of our tests. Sometimes we want to let
# other objects interact with the subject. To do this, use `let`.

describe Robot do
  subject(:robot) { Robot.new }
  let(:light_item) { double("light_item", :weight => 1) }
  let(:max_weight_item) { double("max_weight_item" :weight => 25) }

  describe "#pick_up" do
    it "does not add item past max weight of 250" do
      robot.pick_up(max_weight_item)

      expect do
        robot.pick_up(light_item)
      end.to raise_error(ArgumentError)
    end
  end
end
# RSpec Testing
# Automated testing with Ruby

# /project
#     /lib
#       add.rb
#       prime.cb
#     /spec
#       add_spec.rb
#       prime_spec.rb

# /spec/add_spec.rb
require "add" # this line will include code from "/lib/add.rb"

describe "add method" do
  it "should accept two numbers as arguments" do
    expect { add(2, 3) }.to_not raise_error
  end

  it "should return the sum of the two numbers" do
    expect(add(2, 3)).to eq(5)
    expect(add(10, 12)).to eq(22)
  end
end

# Core RSpec terms
# `describe` names the method being tested
# `it` names the behavior of the being tested
# `expect` shows how that behavior is tested

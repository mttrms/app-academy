# RSpec Syntax & Mechanics

## File Organization
# tests are kept in the `spec` folder, code kept in a `lib` folder.
# test for `hello.rb` are written in `hello_spec.rb`

## Requiring Dependencies
# each file is normally limited to testing a signlef ile and will require the
# file at the top of the spec.

# hello_spec.rb

require 'rspec'
require 'hello'

describe '#hello_world' do

end

# Note that RSpec will by default include the lib/ folder in the require path
# so that we can use require and not require_relative. This is another reason to
# follow the convention of using lib/ and spec/ for your code and your tests,
# respectively.

# hello_spec.rb
require 'rspec'
require 'hello'

describe "#hello_world" do
  it "returns 'Hello, World!'" do
    expect(hello_world).to eq("Hello, World!")
  end
end

# hello.rb
def hello_world
  "Hello, World!"
end

# `it` is RSpec's most basic test unit. All individual tests will go in an
# it block. `describe` is RSpec's unit of organization. It gathers together
# several `it` blocks (and can setup context for blocks of text)

# describe and it take strings as arguments. For describe: use the name of the 
# method you're testing. For it: describe the behavior that is bein tested
# in the it block. describe can also take a constant (Class or Module)

# context is an alias for describe

describe Student do
  context 'when a current student' do
  end

  context 'when graduated' do
  end
end

# `expect` – match between a value code generates and an expected value

expect(test_value).to # ...
expect(test_value).to_not # ...

describe Integer do
  describe '#to_s' do
    it 'returns string representations of integers' do
      expect(5.to_s).to eq('5')
    end
  end
end

# The block construction is necessary when you want to test that a method call
# will thorw an error

describe '#sqrt' do
  it 'throws an error if given a negative number' do
    expect { sqrt(-3) }.to raise_error(ArgumentError)
  end
end

# .to eq vs .to be
expect('hello').to eq('hello') # => passes ('hello' == 'hello')
expect('hello').to be('hello') # => fails (strings are different objects)

# `before` to setup context in which specs will run
describe Chess do
  let (:board) { Board.new }

  describe '#checkmate' do
    context 'when in checkmate' do
      before(:each) do
        board.make_move([3, 4], [2, 3])
        board.make_move([1, 2], [4, 5])
        board.make_move([5, 3], [5, 1])
        board.make_move([6, 3], [2, 4])
      end

      it 'should return true' do
        expect (board.checkmate?(:black)).to be true
      end
    end
  end
end

# `before(:each)` or `before(:all)` can both be used. Almost always will be using
# before(:each). **This will execute the block of code before each spec in that
# describe block** before(:each) does not share state. Start fresh on every spec (it block)
# before(:all) shares state. Tests become dependent on eachother if altering what
# was setup in the before(:all) block

# Don't use != (use .to_not eq)
# On predicate syntatic sugar: With all predicates, you can strip off the ? and
# tack on a "be_" to make an expectation. For example,
# expect(Array.empty?).to be true is equivalent to expect(Array).to be_empty.

# expect(my_hash.has_key?(my_key)).to eq(true)
# expect(my_hash).to have_key(my_key) # same as above


# Notes & Examples from RSpec Docs:
# RSpec Expectations
expect(account.balance).to eq(Money.new(37.42, :USD))

# Equivalence
expect(actual).to eq(expected) # actual == expected
expect(actual).to eql(expected) # actual.eql?(expected)
expect(actual)not_to eql(not_expected) # passes if not actual.eql?(expected)

# Identity
expect(actual).to be(expected)    # actual.equal?(expected)
expect(actual).to equal(expected) # actual.equal?(expected)

# Comparisons
expect(actual).to be > expected
expect(actual).to be >= expected
expect(actual).to be <= expected
expect(actual).to be < expected
expect(actual).to be_within(delta).of(expected)

# Regex
expect(actual).to match(/expression/)

# Types / Classes
expect(actual).to be_an_instance_of(expected) # actual.class == expected
expect(actual).to be_a(expected) # actual.kind_of?(expected)
expect(actual).to be_an(expected) # alias for be_a
expect(actual).to be_a_kind_of(expected) # alias

# Truthiness
expect(actual).to be_truthy # not nil or false
expect(actual).to be true
expect(actual).to be_falsy # nil or false
expect(actual).to be false
expect(actual).to be_nil
expect(actual).to_not be_nil

# Expecting errors
expect { ... }.to raise_error
expect { ... }.to raise_error(ErrorClass)
expect { ... }.to raise_error("message")
expect { ... }.to raise_error(ErrorClass, "message")

# Expecting throws
expect { ... }.to throw_symbol
expect { ... }.to throw_symbol(:symbol)
expect { ... }.to throw_symbol(:symbol, 'value')

# Yielding
expect { |b| 5.tap(&b) }.to yield_control # passes regardless of yielded args

expect { |b| yield_if_true(true, &b) }.to yield_with_no_args # passes only if no args are yielded

expect { |b| 5.tap(&b) }.to yield_with_args(5)
expect { |b| 5.tap(&b) }.to yield_with_args(Integer)
expect { |b| "a string".tap(&b) }.to yield_with_args(/str/)

expect { |b| [1, 2, 3].each(&b) }.to yield_successive_args(1, 2, 3)
expect { |b| { :a => 1, :b => 2 }.each(&b) }.to yield_successive_args([:a, 1], [:b, 2])

# Predicate matchers
expect(actual).to be_xxx         # passes if actual.xxx?
expect(actual).to have_xxx(:arg) # passes if actual.has_xxx?(:arg)

# Collection membership
# exact order, entire collection
expect(actual).to eq(expected)

# exact order, partial collection (based on an exact position)
expect(actual).to start_with(expected)
expect(actual).to end_with(expected)

# any order, entire collection
expect(actual).to match_array(expected)

# You can also express this by passing the expected elements
# as individual arguments
expect(actual).to contain_exactly(expected_element1, expected_element2)

 # any order, partial collection
expect(actual).to include(expected)

# Compoound Matcher Expressions `and` or `or`
expect(alphabet).to start_with("a").and end_with("z")
expect(stoplight.color).to eq("red").or eq("green").or eq("yellow")

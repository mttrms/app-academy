class Code
  attr_accessor :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.include?(peg.upcase) }
  end

  def self.random(num)
    random_pegs = []

    num.times do
      random_pegs << POSSIBLE_PEGS.keys.sample
    end

    Code.new(random_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(pegs)
    @pegs = pegs.map(&:upcase)
    raise "Pegs are invalid" if !Code.valid_pegs?(@pegs)
  end

  def [](idx)
    self.pegs[idx]
  end

  def length
    self.pegs.length
  end

  def num_exact_matches(guess)
    guess.pegs.each_with_index.reduce(0) do |acc, (peg, idx)|
      @pegs[idx] == peg ? acc + 1 : acc
    end
  end

  def num_near_matches(guess)
    count = 0
    peg_search = @pegs.dup

    # remove exact match pegs
    guess.pegs.each_with_index do |peg, idx|
      peg_search[idx] = 'match' if peg_search[idx] == peg
    end

    guess.pegs.each do |peg|
      if peg_search.include?(peg)
        count += 1
      end
    end

    count
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end

end

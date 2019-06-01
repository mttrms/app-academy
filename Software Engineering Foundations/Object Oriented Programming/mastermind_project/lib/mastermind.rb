require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    p "Number of exact matches: #{@secret_code.num_exact_matches(code)}"
    p "Number of near matches: #{@secret_code.num_near_matches(code)}"
  end

  def ask_user_for_guess
    p 'Enter a code'
    guess = Code.from_string(gets.chomp)
    print_matches(guess)
    @secret_code == guess
  end
end

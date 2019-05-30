class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word # Create a class method Hangman#random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = @secret_word.split("").map { |char| "_" }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(guess)
    matches = []
    @secret_word.each_char.with_index do |char, idx|
      matches << idx if char == guess
    end

    matches
  end

  def fill_indices(char, indices)
    indices.each { |idx| @guess_word[idx] = char }
  end

end

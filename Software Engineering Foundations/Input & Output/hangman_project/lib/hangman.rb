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

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    # Log the char guessed
    @attempted_chars << char

    # Check for a match, decrement if wrong, fill if correct
    indices = get_matching_indices(char)
    if indices.length == 0
      @remaining_incorrect_guesses -= 1 
    else
      fill_indices(char, indices)
    end

    # Return true because the guess was not previously attempted
    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp

    try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    end

    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end

    false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end

    false
  end
end

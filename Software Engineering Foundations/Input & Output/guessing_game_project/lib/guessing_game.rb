class GuessingGame
  def initialize(min, max)
    @min = min
    @max = max
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  def num_attempts
    @num_attempts
  end

  def game_over?
    @game_over
  end

  def check_num(num)
    @num_attempts += 1
    if num == @secret_num
      @game_over = true
      puts 'you win'
    elsif num > @secret_num
      puts 'too big'
    else
      puts 'too small'
    end
  end

  def ask_user
    puts 'enter a number'
    guess = gets.chomp.to_i
    check_num(guess)
  end

end

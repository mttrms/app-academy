require "byebug"

def greedy_make_change_iterative(amount, coins = [25, 10, 5, 1])
  change = []
  
  until change.sum == amount
    coins.each do |coin|
      if (amount - change.sum) >= coin
        change << coin
        break
      end
    end
  end

  change
end

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  return [] if amount == 0

  change = []

  largest_coin = coins.find { |coin| amount >= coin }
  change << largest_coin

  next_coin = greedy_make_change(amount - change.sum)
  change += next_coin

  change
end

def make_better_change(amount, coins = [25, 10, 5, 1])
  return [] if amount == 0
  change = []

  coins.each_with_index do |coin, idx|
    if coin <= amount - change.sum
      change << coin
      next_coin = make_better_change(amount - coin, coins[idx..-1])
      change += next_coin
    end
  end

  change
end

# Test Cases
# p greedy_make_change(39) # => [25, 10, 1, 1, 1, 1]
# p greedy_make_change(24, [10,7,1]) # => [10, 10, 1, 1, 1, 1] but should be.... [10, 7, 7]
# p greedy_make_change_iterative(24, [10, 7, 1]) # => [25, 10, 1, 1, 1, 1]
p make_better_change(24, [10, 7, 1]) # => [10, 7, 7]
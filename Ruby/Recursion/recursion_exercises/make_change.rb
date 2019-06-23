require "byebug"

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

  best_change = nil
  coins.each do |coin|
    next if coin > amount

    change = []
    change << coin
    change += make_better_change(amount - coin, coins)

    if best_change == nil || change.length < best_change.length
      best_change = change
    end
  end

  best_change
end

# Test Cases
p greedy_make_change(39) # => [25, 10, 1, 1, 1, 1]
p greedy_make_change(24, [10, 7, 1]) # => [10, 10, 1, 1, 1, 1] but should be.... [10, 7, 7]
p make_better_change(24, [10, 7, 1]) # => [10, 7, 7]

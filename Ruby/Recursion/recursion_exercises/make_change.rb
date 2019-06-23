def greedy_make_change_iterative(amount, coins = [25, 10, 5, 1])
  change = []
  
  until change.sum == amount
    coins.each do |coin|
      if (amount - change.sum) >= coin
        change << coin
        next
      end
    end
  end

  change
  
end

def greedy_make_change(amount, coins = [25, 10, 5, 1])
end

# Test Cases
p greedy_make_change(39) # => [25, 10, 1, 1, 1, 1]

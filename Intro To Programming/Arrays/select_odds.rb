# Write a method select_odds(numbers) that takes in an array of numbers
# and returns a new array containing the odd numbers of the original array.

def select_odds(nums)
  odds = []

  i = 0
  while i < nums.length
    if nums[i] % 2 == 1
      odds << nums[i]
    end
    i += 1
  end
  return odds
end

print select_odds([13, 4, 3, 7, 6, 11, 50, 50, 51, 53, 50]) # => [13, 3, 7, 11]
puts
print select_odds([2, 4, 6, 8, 9, 9, 9, 1, 3, 5])            # => []
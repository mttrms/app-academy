# Write a function sum_to(n) that uses recursion to calculate the sum from 1
# to n (inclusive of n).

def sum_to(n)
  return nil if n < 1
  return n if n == 1
  
  n + sum_to(n - 1)
end

# Test cases
p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil
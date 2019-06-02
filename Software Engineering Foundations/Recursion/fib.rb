# Fibonacci Sequence
# Write a method fib(n) that takes in a number and returns the nth number of
# the fibonacci sequence.
# In the fibonacci sequence, the 1st number is 1 and the 2nd number is 1. To generate the
# next number in the sequence, we take the sum of the previous two fibonacci numbers.
# For example the first 5 numbers of the fibonacci sequence are `1, 1, 2, 3, 5`

# Examples:

# fib(1) # => 1
# fib(2) # => 1
# fib(3) # => 2
# fib(4) # => 3
# fib(5) # => 5
# fib(6) # => 8
# fib(7) # => 13

# fib(4) = fib(3) + fib(2)
# fib(3) = fib(1) + fib(1)
# fib(2) = 1 # base case
# fib(1) = 1 # base case

# fib(n) = fib(n - 1) + fib(n - 2)

def fib(n)
  return 1 if n == 1 || n == 2
  fib(n - 1) + fib(n - 2)
end

p fib(9)

# Recursion is used to solve problems that can be decomposed into smaller
# versions of the same problem.

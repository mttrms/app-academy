# TDD (Test Driven Development) is a strategy to develop programs where the
# requirements for the program are turned into test cases. Changes to program
# are made until the program passes the test cases.

# TDD workflow with prime?
# Write a method `prime?(n)` that takes in a number and returns a
# boolean indicating whether or not the number is a prime.
# A prime number is a number only divisible by two numbers, 1 and itself.

def prime?(num)
  return false if num < 2

  (2...num).each do |i|
    return false if num % i == 0
  end

  true
end

# TDD Iteration 1: return false if the number is not prime
p prime?(6)   # => false
p prime?(8)   # => false
p prime?(9)   # => false

# TDD Iteration 2: return true if the number is prime
p prime?(2)   # => true
p prime?(7)   # => true
p prime?(11)  # => true

# TDD Iteration 3: return false if num < 2 since 2 is the smallest prime
p prime?(1)   # => false
p prime?(0)   # => false
p prime?(-42) # => false
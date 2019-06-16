# Write a function sum_to(n) that uses recursion to calculate the sum from 1
# to n (inclusive of n).

def sum_to(n)
  return nil if n < 1
  return n if n == 1
  
  n + sum_to(n - 1)
end

puts "sum_to"
# Test Cases
p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil

# Write a function add_numbers(nums_array) that takes in an array of Integers
# and returns the sum of those numbers. Write this method recursively.

def add_numbers(arr)
  return arr[0] if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

puts "add_numbers"
# Test Cases
p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil

# Let's write a method that will solve Gamma Function recursively. The Gamma
# Function is defined Γ(n) = (n-1)!.

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1
  
  (num - 1) * gamma_fnc(num - 1)
end

puts "gamma_fnc"
# Test Cases
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040

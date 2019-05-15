# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
  all_divsors = get_divisors(num1) + get_divisors(num2)
  !common_divisors?(all_divsors.sort)
end

def get_divisors(num)
  divisors = []
  (2..num).each do |i|
    divisors << i if num % i == 0
  end
  divisors
end

def common_divisors?(arr)
  arr.each_with_index do |i, idx|
    return true if i == arr[idx + 1]
  end
  false
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false

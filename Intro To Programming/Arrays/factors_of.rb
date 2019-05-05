# Write a method factors_of(num) that takes in a num and returns an array
# of all positive numbers less than or equal to num that can divide num.

def factors_of(num)
  factors = []
  
  i = 1
  while i <= num
    if num % i == 0
      factors << i
    end
    i += 1
  end

  return factors
end

print factors_of(3)   # => [1, 3]
puts
print factors_of(4)   # => [1, 2, 4]
puts
print factors_of(8)   # => [1, 2, 4, 8]
puts
print factors_of(9)   # => [1, 3, 9]
puts
print factors_of(16)  # => [1, 2, 4, 8, 16]
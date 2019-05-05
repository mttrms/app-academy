# Write a method even_nums(max) that takes in a number max and returns an
# array containing all even numbers from 0 to max

def even_nums(max)
  some_even_nums = []

  i = 0
  while i <= max
    if i % 2 == 0
      some_even_nums << i
    end
    i += 1
  end

  return some_even_nums
end

print even_nums(10) # => [0, 2, 4, 6, 8, 10]
puts
print even_nums(5)  # => [0, 2, 4]
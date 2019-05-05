# Write a method either_only(number) that takes in a number
# and returns true if the number is divisible by either 3 or 5,
# but not both. The method should return false otherwise.

def either_only(number)
  if (number % 3 == 0 || number % 5 == 0) && !(number % 3 == 0 && number % 5 == 0)
    return true
  else
    return false
  end
end

puts either_only(9)  # => true
puts either_only(20) # => true
puts either_only(7)  # => false
puts either_only(15) # => false
puts either_only(30) # => false
def is_div_by_5(number)
  return number % 5 == 0
end

puts is_div_by_5(10) # => true
puts is_div_by_5(40) # => true
puts is_div_by_5(42) # => false
puts is_div_by_5(8)  # => false
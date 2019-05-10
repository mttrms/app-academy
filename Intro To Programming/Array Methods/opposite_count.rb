# Write a method opposite_count that takes in an array of unique numbers. The method
# should return the number of pairs of elements that sum to 0.

def opposite_count(numbers)
  count = 0

  numbers.each_with_index do |num1, idx1|
    numbers.each_with_index do |num2, idx2|
      if num1 + num2 == 0 && (idx2 > idx1)
        count += 1
      end
    end
  end

  return count
end

puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1
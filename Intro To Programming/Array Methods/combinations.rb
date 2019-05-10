# Write a method combinations that takes in an array of unique elements, the method
# should return a 2D array representing all possible combinations of 2 elements of the array.

# def combinations(arr)
#   two_dimensional_arr = []

#   i = 0
#   while i < arr.length
#     j = i + 1
#     while j < arr.length
#       two_dimensional_arr << [arr[i], arr[j]]
#       j += 1
#     end
#     i += 1
#   end

#   return two_dimensional_arr
# end

def combinations(arr)
  pairs = []

  arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
      if idx2 > idx1
        pairs << [ele1, ele2]
      end
    end
  end

  return pairs
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts
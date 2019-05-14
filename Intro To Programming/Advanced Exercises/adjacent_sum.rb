# Write a method adjacent_sum that takes in an array of numbers and returns a
# new array containing the sums of adjacent numbers in the original array. See
# the examples.

def adjacent_sum(arr)
  sums = arr.map.with_index do |num, idx|
    if idx != arr.length - 1
      num + arr[idx + 1]
    end
  end

  return sums.compact
end

# the "solution" provided
# def adjacent_sum(arr) 
#   new_arr = []
#   arr.each_with_index do |ele, idx|
#     if idx != arr.length - 1
#       new_arr << ele + arr[idx + 1]
#     end
#   end
  
#   return new_arr
# end

# another alternative
# def adjacent_sum(arr)
#   sums = []
  
#   i = 0
#   while i < arr.length - 1
#     current_element = arr[i]
#     next_element = arr[i + 1]
#     sums << current_element + next_element
#     i += 1
#   end

#   return sums
# end


print adjacent_sum([3, 7, 2, 11]) #=> [10, 9, 13], because [ 3+7, 7+2, 2+11 ]
puts
print adjacent_sum([2, 5, 1, 9, 2, 4]) #=> [7, 6, 10, 11, 6], because [2+5, 5+1, 1+9, 9+2, 2+4]
puts
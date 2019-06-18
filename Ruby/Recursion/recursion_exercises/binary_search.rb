require "byebug"

# def bsearch(arr, target)
#   return target if arr.first == target
#   return nil if arr.length == 1 && arr.first != target
#   mid_point = arr.length / 2
#   # p target < arr[(arr.length / 2)]

  # target < arr[(arr.length / 2)] ? bsearch(arr[0...mid_point], target) : bsearch(arr[mid_point..-1], target)

  
# end

# def bsearch(arr, target, left = 0, right = nil)
#   right = (arr.length - 1) if right == nil
#   mid = (right + left) / 2
  

#   return mid if arr[mid] == target

#   if target < arr[mid]
#     bsearch(arr[0..mid], target, left, mid)
#   else 
#     bsearch(arr[mid + 1..right], target, mid + 1, right)
#   end
  
  

# end

def bsearch(arr, target)
  mid_point = arr.length / 2
  lower = arr[0...mid_point]
  upper = arr[mid_point..-1]
  
  if arr[mid_point] == target
    mid_point
  elsif arr[mid_point] > target
    bsearch(lower, target)
  elsif arr[mid_point] < target
    bsearch(upper, target) + mid_point
  end

  # lower
end

# Test Cases
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
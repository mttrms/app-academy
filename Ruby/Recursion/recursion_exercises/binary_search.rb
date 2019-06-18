def bsearch(arr, target, left = 0, right = nil)
  right = arr.length - 1 if right == nil
  
  if right >= left
    mid = left + (right - left) / 2

    if arr[mid] == target
      return mid
    elsif target < arr[mid]
      bsearch(arr, target, 0, mid - 1)
    else
      bsearch(arr, target, mid + 1, right)
    end
    
  else
    nil
  end
end

def bsearch_alt(arr, target)
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
end

# Test Cases
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
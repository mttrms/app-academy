def bsearch(arr, target)
  mid_point = arr.length / 2
  return nil if arr.length <= 1 && arr[0] != target
  
  if arr[mid_point] == target
    mid_point
  elsif arr[mid_point] > target
    bsearch(arr[0...mid_point], target)
  elsif arr[mid_point] < target
    upper_bsearch = bsearch(arr[mid_point..-1], target)
    upper_bsearch == nil ? nil : upper_bsearch + mid_point
  end
end

def bsearch2(arr, target, left = 0, right = nil)
  debugger
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



# Test Cases
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
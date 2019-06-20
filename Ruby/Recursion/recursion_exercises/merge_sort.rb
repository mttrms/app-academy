require "byebug"

def merge_sort(arr)
  debugger
  return arr.first if arr.length == 1
  mid = (arr.length - 1) / 2
  
  merge_sort(arr[0..mid])
  merge_sort(arr[mid + 1..-1])  
end

# Test cases
p merge_sort([6, 5, 3, 1, 8, 7, 2, 4])
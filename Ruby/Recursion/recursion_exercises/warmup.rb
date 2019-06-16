# Write a recursive method, range, that takes a start and an end and returns an
# array of all numbers in that range, exclusive.

def range(start_num, end_num)
  return [] if end_num < start_num || start_num == end_num
  nums = []
  nums << start_num
  nums += range(start_num + 1, end_num)
  
end

p range(5, 1)
p range(1, 20)

# Write both a recursive and iterative version of sum of an array.

def iterative_sum_array(arr)
  arr.reduce { |sum, num| sum + num }
end

p iterative_sum_array([1,2,3,4,5,6])

def recursive_sum_array(arr)
  return arr.first if arr.length == 1
  arr.first + recursive_sum_array(arr[1..-1])
end

p recursive_sum_array([1,2,3,4,5,6])
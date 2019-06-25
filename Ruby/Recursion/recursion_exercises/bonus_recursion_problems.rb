# Problem 1: You have array of integers. Write a recursive solution to find the sum of the integers.
def sum_recur(array)
  return array[0] if array.length == 1
  sum = array.first

  sum += sum_recur(array[1..-1])
end

p sum_recur([5,6,7,10,1,2,3])

# Problem 2: You have array of integers. Write a recursive solution to determine whether or not the array contains a specific value.
def includes?(array, target)
  if array.first == target
    return true
  elsif array.length == 1
    return false
  end

  includes?(array[1..-1], target)
end

p includes?([1,2,3,4], 5)

# Problem 3: You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.
def num_occur(array, target)
  count = 0
  return 0 if array.empty?
  count += 1 if array.first == target
  count += num_occur(array[1..-1], target)
end

p num_occur([1,2,2,3,2,5,2,1,5,5,5,5,0,1,2,1], 2)

# Problem 4: You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.
def add_to_twelve?(array)
  return false if array.length == 1
  return true if array[0] + array[1] == 12

  add_to_twelve?(array[1..-1])
end

p add_to_twelve?([5,4,6,2,9,11,0,4,8])

# Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.
def sorted?(array)
  if array.length == 2
    return array[0] < array[1]
  end

  return false if array[0] > array[1]

  sorted?(array[1..-1])
  
end

p sorted?(["a","b","c","b"])
p sorted?([0,1,2,3,4])

# Problem 6: Write a recursive function to reverse a string. Don't use any built-in #reverse methods!
def reverse(string)
end

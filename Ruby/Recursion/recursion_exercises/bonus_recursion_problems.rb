# Problem 1: You have array of integers. Write a recursive solution to find the sum of the integers.
def sum_recur(array)
  return 0 if array.empty?
  sum_recur(array.drop(1)) + array.first
end

p sum_recur([5,6,7,10,1,2,3])

# Problem 2: You have array of integers. Write a recursive solution to determine whether or not the array contains a specific value.
def includes?(array, target)
  return true if array.first == target
  return false if array.empty?
  includes?(array.drop(1), target)
end

p includes?([1,2,3,4], 5)

# Problem 3: You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.
def num_occur(array, target)
  return 0 if array.empty?
  count = array.first == target ? 1 : 0
  count += num_occur(array.drop(1), target)
end

p num_occur([1,2,2,3,2,5,2,1,5,5,5,5,0,1,2,1], 2)

# Problem 4: You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.
def add_to_twelve?(array)
  return false if array.length == 1
  return true if array[0] + array[1] == 12
  add_to_twelve?(array.drop(1))
end

p add_to_twelve?([5,4,6,2,9,11,0,4,8])

# Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.
def sorted?(array)
  return true if array.length <= 1
  return false if array[0] > array[1]
  sorted?(array[1..-1])
end

p sorted?(["a","b","c","b"])
p sorted?([0,1,2,3,4])

# Problem 6: Write a recursive function to reverse a string. Don't use any built-in #reverse methods!
def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0...-1])
end

p reverse("hello world")
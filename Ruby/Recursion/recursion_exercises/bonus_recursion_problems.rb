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
end

# Problem 4: You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.
def add_to_twelve?(array)
end

# Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.
def sorted?(array)
end

# Problem 6: Write a recursive function to reverse a string. Don't use any built-in #reverse methods!
def reverse(string)
end

# Write a method unique_elements that takes in an array and returns a new
# array where all duplicate elements are removed. Solve this using a hash.

def unique_elements(arr)
  count = {}
  arr.each { |ele| count[ele] = 1 }
  return count.keys
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts
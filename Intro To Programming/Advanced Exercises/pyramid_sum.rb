# Write a method pyramid_sum that takes in an array of numbers representing
# the base of a pyramid. The function should return a 2D array representing a
# complete pyramid with the given base. To construct a level of the pyramid,
# we take the sum of adjacent elements of the level below.

def pyramid_sum(base)
  pyramid = [base]
  
  while pyramid.length < base.length
    pyramid.push(adjacent_sum(pyramid[-1]))  
  end

  return pyramid.reverse
end

def adjacent_sum(arr)
  sums = arr.map.with_index do |num, idx|
    if idx != arr.length - 1
      num + arr[idx + 1]
    end
  end
  return sums.compact
end

print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts

# [
#   [15],
#   [5, 10],
#   [1, 4, 6]
# ]
# Write a method two_d_translate that takes in a 2 dimensional array and
# translates it into a 1 dimensional array. You can assume that the inner
# arrays always have 2 elements. See the examples.

def two_d_translate(arr)
  one_d = []
  arr.each { |sub_arr| sub_arr[1].times { one_d << sub_arr[0]} }
  return one_d
end

# def two_d_translate(arr)
#   one_d = []

#   arr.each do |sub_array|
#     ele = sub_array[0]
#     num = sub_array[1]

#     num.times { one_d << ele }
#   end

#   return one_d
# end

arr_1 = [
  ['boot', 3],
  ['camp', 2],
  ['program', 0]
]

print two_d_translate(arr_1) # => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]
puts

arr_2 = [
  ['red', 1],
  ['blue', 4]
]

print two_d_translate(arr_2) # => [ 'red', 'blue', 'blue', 'blue', 'blue' ]
puts
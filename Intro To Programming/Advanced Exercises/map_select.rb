# Array-Giving Enumerables
# map
# select (write an expression that evaluates to a boolean)

# Map
arr = ["a", "b", "c", "d"]
new_arr = arr.map { |ele| ele.upcase + "!" }
print new_arr
puts

# new_arr = []
# arr.each { |ele| new_arr << ele.upcase}
# print new_arr

words = ["apple", "tESting", "cArrOt", "JuMP"]
# new_words = words.map { |word| word[0].upcase + word[1..-1].downcase }
new_words = words.map.with_index do |word, idx| # with_index optional
  first_char = word[0].upcase
  rest = word[1..-1].downcase
  new_word = first_char + rest 
  new_word * idx # last expression will update the element in a do block
end
print new_words
puts


# Select
nums = [1,2,3,4,5,6]
evens = nums.select { |ele| ele %2 == 0 }
print evens
puts

# evens = []
# nums.each do |num|
#   if num % 2 == 0
#     evens << num
#   end
# end
# print evens
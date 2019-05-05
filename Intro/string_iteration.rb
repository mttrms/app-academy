# Iterating through strings with loops

str = "hello world"
# puts str[0]
# puts str[1]
# puts str[4]


def printChars(str)
  i = 0
  while i < str.length
    puts str[i]
    i += 1
  end
end

printChars('cats')

# Exercise

puts "a" + "b"
puts "b " + "c"
puts "c" + " d"

puts 'hello'.length
puts 'world'.length
puts 'length'.length + 10

puts 'hello'[1]
puts 'ruby'[3]
puts 'rubular'[2]
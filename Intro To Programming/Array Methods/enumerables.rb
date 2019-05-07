# Enumerable methods
# array
#   .each
#   .each_with_index
# string
#   .each_char
#   .each_char.with_index

# range enumerable
#   (start..end).each – iterate from start to end inclusive
#   (start...end).each - iterate from start to end excluding end

months = ["Jan", "Feb", "Mar", "Apr"]

# months.each { |month| puts month } – good for single line blocks

months.each_with_index do |month, idx|
  puts month
  puts idx
  
end

sentence = "hello world"

sentence.each_char.with_index do |char, idx|
  puts char
  puts idx
end

# arr = [1,2,3,4,5]

(1..10).each { |num| puts num}

def fizzBuzz(max)
  arr = []

  (1...max).each do |num|
    if num % 3 == 0 && num % 5 != 0
      arr << num
    elsif num % 3 != 0 && num % 5 == 0
      arr << num
    end
  end

  return arr
end

print fizzBuzz(30)
puts
# (0...4).each { puts 'num' }

4.times {puts 'hey'}
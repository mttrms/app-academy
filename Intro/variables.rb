# Variables

location = "NY"
puts location

my_num = 42
my_num += 8
my_num *= 2

my_num /= 2
puts my_num

is_even = my_num % 2 == 0
puts is_even

# Exercises

# 1. Declare a variable named `firstName` and assign it your first name as a string:

firstName = "Matt"

# 2. Declare a variable named `lastName` and assign it your last name as a string:

lastName = "Ramos"

# 3. Declare a variable named `fullName` and assign it the concatenation of
# your `firstName` and `lastName`. Be sure to put a space between your
# first and last names:

fullName = firstName + " " + lastName

# 4. print out the `fullName` variable

puts fullName

sentence = "There is no spoon"
puts "---1:"
puts sentence + "?"   # There is no spoon?

puts "---2:"
puts sentence         # There is no spoon

sentence += "."
puts "---3:"
puts sentence         # There is no spoon.

num = 6 / 2
puts "---4:"
puts num              # 3

puts "---5:"
puts sentence[num]    # r


num = 40
num + 5
puts "---1:"
puts num                   # 40

num += 2
puts "---2:"
puts num                   # 42

isEven = num % 2 == 0
puts "---3:"
puts isEven                # true

isNegative = num < 0
puts "---4:"
puts isNegative            # false

puts "---5:"
puts isEven || isNegative  # true

puts "---6:"
puts isEven && isNegative  # false

puts "---7:"
puts isEven && !isNegative # true
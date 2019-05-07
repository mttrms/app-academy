people = ["Candace", "Jon", "Jose"]

# iterate over elements of an array using each
people.each { |person| puts person } # prints
# Candace
# Jon
# Jose

# iterate over elements of an array with index using each_with_index
people.each_with_index do |person, i|
  puts person
  puts i
  puts "-----"
end # prints
# Candace
# 0
# -----
# Jon
# 1
# -----
# Jose
# 2
# -----

greeting = "hello"

# iterate over characters of a string using each_char
greeting.each_char { |char| puts char } # prints
# h
# e
# l
# l
# o

# iterate over characters of a string with index using each_char.with_index
greeting.each_char.with_index do |char, i|
  puts char
  puts i
  puts "---"
end # prints
# h
# 0
# ---
# e
# 1
# ---
# l
# 2
# ---
# l
# 3
# ---
# o
# 4
# ---

# repeat a block using times
3.times do
  puts "hi"
end # prints
# hi
# hi
# hi

# specify a range of numbers using (start..end) or (start...end)

# including end
(2..6).each {|n| puts n} # prints
# 2
# 3
# 4
# 5
# 6

# excluding end
(2...6).each {|n| puts n} # prints
# 2
# 3
# 4
# 5

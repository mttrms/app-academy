# Exceptions in Ruby
# Exceptions are what Ruby uses to deal with errors or other unexpected events.

num = 0

begin
  puts "dividing 10 by #{num}"
  answer = 10 / num
  puts "the answer is #{answer}"
rescue
  puts "There was an error with that division"
end

puts "----"
puts "finished"

# begin...rescue
# code in `begin` will execute until an exception is reached, then jump to `rescue`

# `raise` to make manual exceptions

def format_name(first, last)
  if !(first.instance_of?(String) && last.instance_of?(String))
    raise "arguments must be strings"
  end

  first.capitalize + " " + last.capitalize
end

# puts format_name("grace", "HOPPER")
# puts format_name(42, true)

begin
  puts format_name(firstname, lastname)
rescue
  puts "there was an exception :("
end
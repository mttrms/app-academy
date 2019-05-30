# User Input
# The gets method will allow users to provide an input.

p "Enter your name:"
name = gets
p "hello " + name

# gets will append a newline \n at the end of the string. Use #chomp to remove newline chars at the end

p "Enter 'yes' or 'no"

response = gets.chomp

if response == "yes"
  puts "yep"
elsif response == "no"
  puts "nope"
else
  puts "neither"
end

# #gets will always return a string, so if a number is required, it must be
# convereted with #to_i
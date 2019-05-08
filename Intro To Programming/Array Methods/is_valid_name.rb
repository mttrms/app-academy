# Write a method is_valid_name that takes in a string and returns a boolean
# indicating whether or not it is a valid name.

def is_valid_name(str)
  name_parts = str.split(" ")

  if name_parts.length < 2
    return false
  end

  name_parts.each do |name|
    if !(name[0] == name[0].upcase && name[1..-1] == name[1..-1].downcase)
      return false
    end

  end
  return true
end

puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false
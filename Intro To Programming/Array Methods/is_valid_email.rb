# Write a method is_valid_email that takes in a string and returns a boolean
# indicating whether or not it is a valid email address.

def is_valid_email(str)
  email_parts = str.split("@")

  if email_parts.length != 2
    return false
  elsif email_parts[0] != email_parts[0].downcase
    return false
  elsif contains_a_number(email_parts[0])
    return false
  end

  domain_parts = email_parts[1].split(".")
  if domain_parts.length != 2
    return false
  end
  
  return true
end

def contains_a_number(str)
  numbers = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9"]
  str.each_char do |char|
    if numbers.include?(char)
      return true
    end
  end
  return false
end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false
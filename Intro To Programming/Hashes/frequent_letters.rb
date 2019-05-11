# Write a method frequent_letters that takes in a string and returns an array
# containing the characters that appeared more than twice in the string.

def frequent_letters(str)
  letter_count = Hash.new(0)
  str.each_char { |char| letter_count[char] += 1 }

  frequent_chars = []
  letter_count.each do |char, num|
    if num > 2
      frequent_chars << char
    end
  end
  return frequent_chars
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts
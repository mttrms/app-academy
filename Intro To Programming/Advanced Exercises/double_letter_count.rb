# Write a method that takes in a string and returns the number of times that
# the same letter repeats twice in a row.

# This is a bad exercise. Doesn't explain what "double" is. how many doubles
# are in 'aaaa'? 1? 3? 0?

def double_letter_count(str)
  double_letters = str.split("").select.with_index do |char, idx|
    seq = str[idx...idx + 3]
    double_letters?(char, seq)
  end

  return double_letters.length
end

def double_letters?(char, seq)
  if seq[0] == seq[1] && seq[1] != seq[2]
    char
  end
end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1
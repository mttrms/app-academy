# Write a method vowel_cipher that takes in a string and returns a new string
# where every vowel becomes the next vowel in the alphabet.

# def vowel_cipher(str)
#   vowels = "aeiou"
#   new_str = ""

#   str.each_char do |char|
#     if vowels.include?(char)
#       old_idx = vowels.index(char)
#       new_idx = old_idx += 1
#       new_str += vowels[new_idx % vowels.length]
#     else
#       new_str += char
#     end
#   end

#   return new_str
# end

def vowel_cipher(str)
  vowels = "aeiou"

  new_str = str.split("").map do |char|
    if vowels.include?(char)
      old_idx = vowels.index(char)
      new_idx = old_idx + 1
      vowels[new_idx % vowels.length]
    else
      char
    end
  end

  return new_str.join("")
end

def another_vowel_cipher(str) # How to solve with a hash
  change = {
    "a" => "e",
    "e" => "i",
    "i" => "o",
    "o" => "u",
    "u" => "a"
  }

  vowels = "aeiou"

  new_str = str.split("").map do |char|
    if vowels.include?(char)
      change[char]
    else
      char
    end
  end

  return new_str.join("")
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap
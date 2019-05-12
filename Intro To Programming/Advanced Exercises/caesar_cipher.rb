# Write a method caesar_cipher that takes in a string and a number. The method
# should return a new string where every character of the original is shifted
# num characters in the alphabet.

# def caesar_cipher(str, num)
#   alphabet = "abcdefghijklmnopqrstuvwxyz"
#   cipher = "abcdefghijklmnopqrstuvwxyz".split("")
#   num.times { cipher.push(cipher.shift) }

#   new_string = ""

#   str.each_char do |char|
#     alphabet_index = alphabet.index(char)
#     new_string += cipher[alphabet_index]
#   end

#   return new_string
# end

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  new_string = ""

  str.each_char do |char|
    old_idx = alphabet.index(char)
    new_idx = old_idx + num
    new_string += alphabet[new_idx % 26]
  end

  return new_string
end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"
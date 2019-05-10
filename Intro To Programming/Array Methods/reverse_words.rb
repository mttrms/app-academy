# Write a method reverse_words that takes in a sentence string and returns the sentence
# with the order of the characters in each word reversed. Note that we need to reverse
# the order of characters in the words, do not reverse the order of words in the sentence.

# def reverse_words(str)
#   words = str.split(" ")
#   reversed = []

#   words.each do |word|
#     reversed_word = ""
#     word.each_char do |char|
#       reversed_word = char + reversed_word
#     end
#     reversed << reversed_word

#   end
  
#   return reversed.join(" ")
# end

def reverse_words(str)
  words = str.split(" ")
  words.each { |word| word.reverse! }
  return words.join(" ")
end

puts reverse_words('keep coding') # => 'peek gnidoc'
puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'
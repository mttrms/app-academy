# Write a method anagrams? that takes in two words and returns a boolean
# indicating whether or not the words are anagrams. Anagrams are words that
# contain the same characters but not necessarily in the same order. Solve
# this without using .sort

# Ways to solve this:
#   word1.sort == word2.sort
#   hash of characters, compare hashes
#   iterate over word1 chars, check if word2 includes them

def anagrams?(word1, word2)
  return char_count(word1) == char_count(word2)
end

def char_count(word)
  count = Hash.new(0)
  word.each_char { |char| count[char] += 1}
  return count
end

# Very bad way to solve this.. I didn't know hash1 == hash2 even unsorted.
# def anagrams?(word1, word2)
#   if word1.length != word2.length
#     return false
#   end

#   checked_word = word2

#   i = 0
#   while i < word1.length
#     word1.each_char do |char|
#       if checked_word.include?(char)
#         char_idx = checked_word.index(char)
#         checked_word = checked_word[0...char_idx] + checked_word[char_idx+1..-1]
#       elsif checked_word.length == 0
#         return true
#       else
#         return false
#       end
#     end
#     i += 1
#   end

# end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false


# Me learning that unsorted hash1 == unsorted hash3
# count1 = {"a" => 1, "b" => 2}
# count2 = {"a" => 1, "b" => 2}
# count3 = {"b" => 2, "a" => 1}
# puts count1 == count2
# puts count1 == count3
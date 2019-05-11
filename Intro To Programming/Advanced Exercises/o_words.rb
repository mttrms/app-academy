# Write a method o_words that takes in a sentence string and returns
# an array of the words that contain an "o". Use select in your solution!

def o_words(str)
  str.split.select { |word| word.include?("o")}
end

print o_words("How did you do that?") #=> ["How", "you", "do"]
puts
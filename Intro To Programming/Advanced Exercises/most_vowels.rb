# Write a method most_vowels that takes in a sentence string and returns the
# word of the sentence that contains the most vowels.

# def most_vowels(str)
#   words = str.split
#   word_with_most_vowels = ""
#   vowel_count = 0
#   vowels = "aeiou"

#   words.each do |word|
#     count = 0
#     word.each_char do |char|
#       if vowels.include?(char)
#         count +=1
#       end
#     end
    
#     if count > vowel_count
#       vowel_count = count
#       word_with_most_vowels = word
#     end

#   end
#   word_with_most_vowels
# end

def most_vowels(sentence)
  counts = {}
  
  sentence.split.each do |word|
    counts[word] = vowel_count(word)
  end
  
  vowel_counts = counts.sort_by { |k, v| v}
  vowel_counts[-1][1]
end

def vowel_count(word)
  count = 0
  vowels = "aeiou"
  
  word.each_char do |char|
    if vowels.include?(char)
      count += 1
    end
  end
  
  return count
end

print most_vowels("what a wonderful life") #=> "wonderful"
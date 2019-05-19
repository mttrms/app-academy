# Debug this code to pass rspec! There are 2 mistakes to fix.

# Write a method, titleize, that accepts a string representing a title 
# and capitalizes each word in a string except 'a', 'and', 'of', 'on', or 'the'.
# The first word of the title should be capitalized no matter what.

require "byebug"

def titleize(title)
  words = title.split(" ")
  little_words = [ "and", "the", "over", "a", "on", "of" ]

  titleized_words = words.map.with_index do |word, i|
    # debugger
    if i == 0 || !little_words.include?(word)
      word.capitalize
    else
      word.downcase
    end
  end

  titleized_words.join(" ")
end

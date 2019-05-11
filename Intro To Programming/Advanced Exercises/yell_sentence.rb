# Write a method yell_sentence that takes in a sentence string and returns
# a new sentence where every word is yelled. See the examples. Use map
# to solve this.

def yell_sentence(str)
  str.split.map { |word| word.upcase + "!"}.join(" ")
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"
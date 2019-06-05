# ### Factors
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  num_factors = []

  (1..num).each do |factor|
    num_factors << factor if num % factor == 0
  end

  num_factors
end

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  subs = []

  (0...string.length - 1).each do |start_idx|
    (start_idx...string.length).each do |end_idx|
      subs << string[start_idx..end_idx]
    end
  end

  subs
end

def subwords(word, dictionary)
  subs = substrings(word)
  subs.select { |sub| dictionary.include?(sub) }.uniq
end
# Write a method count_e(word) that takes in a string word and
# returns the number of e's in the word

def count_e(word)
  count = 0
  i = 0

  while i < word.length
    if word[i] == 'e'
      count += 1
    end
    i += 1
  end

  return count
end

puts count_e("movie") # => 1
puts count_e("excellent") # => 3
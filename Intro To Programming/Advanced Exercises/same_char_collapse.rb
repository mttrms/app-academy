# Write a method same_char_collapse that takes in a string and returns a
# collapsed version of the string. To collapse the string, we repeatedly
# delete 2 adjacent characters that are the same until there are no such
# adjacent characters. If there are multiple pairs that can be collapsed,
# delete the leftmost pair. For example, we take the following steps to 
# collapse "zzzxaaxy": zzzxaaxy -> zxaaxy -> zxxy -> zy

# My initial approach
# def same_char_collapse(word)
#   current_idx = 0
#   trimmed_word = word

#   while current_idx < trimmed_word.length
#     next_idx = current_idx + 1
#     if trimmed_word[current_idx] == trimmed_word[next_idx]
#       trimmed_word = trimmed_word[0...current_idx] + trimmed_word[current_idx + 2..-1]
#       current_idx = 0
#     else
#       current_idx +=1
#     end
#   end

#   return trimmed_word
# end

# The given solution
def same_char_collapse(str)
  reducible = true

  while reducible
    chars = str.split("")
    reducible = false

    chars.each.with_index do |char, i|
      if chars[i] == chars[i + 1]
        chars[i] = ""
        chars[i + 1] = ""
        reducible = true
        break
      end
    end

    str = chars.join("")
  end

  return str
end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv
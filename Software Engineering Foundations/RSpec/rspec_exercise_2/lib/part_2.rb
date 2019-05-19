def palindrome?(str)
  reversed_str = ""
  str.each_char { |char| reversed_str = char + reversed_str }
  reversed_str == str
end

# palindrome alternative solution: str[i] != str[-i - 1]

def substrings(str)
  subs = []

  (0...str.length).each do |start_idx|
    (start_idx...str.length).each do |end_idx|
      subs << str[start_idx..end_idx]
    end
  end

  subs
end

def palindrome_substrings(str)
  substrings(str).select { |sub| palindrome?(sub) && sub.length > 1 }
end

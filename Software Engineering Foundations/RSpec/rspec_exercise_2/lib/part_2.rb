def palindrome?(str)
  reversed_str = ""
  str.each_char { |char| reversed_str = char + reversed_str }
  reversed_str == str
end

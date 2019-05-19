def palindrome?(str)
  reversed_str = ""
  str.each_char { |char| reversed_str = char + reversed_str }
  reversed_str == str
end

def substrings(str)
  subs = []

  (0...str.length).each do |i|
    (i...str.length).each do |j|
      subs << str[i..j]
    end
  end

  subs
end

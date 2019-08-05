# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.
# O(n!) time / space
def first_anagram?(str1, str2)
  anagrams = str1.split("").permutation.to_a.map! { |anagram| anagram.join("") }
  anagrams.include?(str2)
end

p first_anagram?("present", "serpent")


# O(n^2) time, O(n) space
def second_anagram?(str1, str2)
  return false if str1.length != str2.length

  str2 = str2.split("")
  str1.each_char do |char|
    str2.delete(char) if str2.include?(char)
  end

  str2.empty?
end

p second_anagram?("present", "serpent")


# O(n^2) time (worst), O(n) space
def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

p third_anagram?("present", "serpent")


# O(n) time, O(1) space
def fourth_anagram?(str1, str2)
  return false if str1.length != str2.length

  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char { |char| hash1[char] +=1 }
  str2.each_char { |char| hash2[char] +=1 }

  hash1.each { |char, count| return false if hash2[char] != count }

  true
end

p fourth_anagram?("present", "serpent") 


# O(n) time, O(1) space
def fifth_anagram?(str1, str2)
  return false if str1.length != str2.length

  chars = Hash.new { |h, k| h[k] = [0, 0] }

  (0...str1.length).each do |idx|
    chars[str1[idx]][0] += 1
    chars[str2[idx]][1] += 1
  end

  chars.each_value { |count| return false if count[0] != count[1] }

  true
end

# Can also solve in one hash with str1 += 1 and str2 -=1, then checking to see if each value == 0

p fifth_anagram?("present", "serpent") 


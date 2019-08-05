# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.
# O(n!) time / space
def first_anagram?(str1, str2)
  anagrams = str1.split("").permutation.to_a.map! { |anagram| anagram.join("") }
  anagrams.include?(str2)
end

p first_anagram?("present", "serpent")

# O(n) time
def second_anagram?(str1, str2)
  return false if str1.length != str2.length

  str2 = str2.split("")
  str1.each_char do |char|
    str2.delete(char) if str2.include?(char)
  end

  str2.empty?
end

p second_anagram?("present", "serpent")

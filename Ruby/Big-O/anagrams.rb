# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.
# O(n!) time / space
def first_anagram?(str1, str2)
  anagrams = str1.split("").permutation.to_a.map! { |anagram| anagram.join("") }
  anagrams.include?(str2)
end

p first_anagram?("present", "serpent")

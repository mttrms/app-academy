def hipsterfy(word)
  vowels = "aeiou"

  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      return word[0...i] + word[i+1..-1]
    end
    i -= 1
  end

  word
end

def vowel_counts(str)
  count = Hash.new(0)
  
  str.each_char do |char|
    count[char.downcase] += 1 if "aeiou".include?(char.downcase)
  end

  count
end

def caesar_cipher(str, num)
  alphabet = ("a".."z").to_a
  new_string = ""

  str.each_char do |char|
    if alphabet.include?(char)
      old_idx = alphabet.index(char)
      new_idx = old_idx + num
      new_string += alphabet[new_idx % 26]
    else
      new_string += char
    end
  end

  return new_string
end
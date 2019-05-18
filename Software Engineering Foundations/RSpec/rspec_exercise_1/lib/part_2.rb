def hipsterfy(word)
  vowels = "aeiou"
  word.reverse!
  word.each_char.with_index do |char, idx|
    if vowels.include?(char)
      word = word[0...idx] + word[idx + 1..-1]
      return word.reverse
    end
  end

  word.reverse
end

def vowel_counts(str)
  count = Hash.new(0)
  
  str.each_char do |char|
    count[char.downcase] += 1 if "aeiou".include?(char.downcase)
  end

  count
end

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
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
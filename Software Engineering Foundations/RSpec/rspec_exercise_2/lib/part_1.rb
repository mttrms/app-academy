def partition(arr, limit)
  arr.reduce([ [], [] ]) do |acc, num|
    lower = acc[0]
    higher = acc[1]
    
    num < limit ? lower << num : higher << num

    [lower, higher]
  end
end

def merge(hash1, hash2)
  merged_hash = hash2.clone # makes a 'shallow' copy of hash2
  hash1.each { |k, v| merged_hash[k] = v if !merged_hash.has_key?(k) }
  merged_hash
end

def censor(sentence, filter)
  filtered = sentence.split.map do |word|
    if filter.include?(word.downcase)
      censored_word = ""

      word.each_char do |char|
        "aeiou".include?(char.downcase) ? censored_word << "*" : censored_word << char
      end

      censored_word
    else
      word
    end
  end
  
  return filtered.join(" ")
end

def power_of_two?(num)
  (0..num).each { |i| return true if 2 ** i == num }
  false
end

def all_words_capitalized?(arr)
  arr.all? { |word| word == word.capitalize }
end

def no_valid_url?(arr)
  arr.none? { |url| valid_url(url) }
end

def valid_url(str)
  tlds = [".com", ".net", ".io", ".org"]
  tlds.each { |tld| return true if str.include?(tld) }
  false
end

def any_passing_students?(arr)
  arr.any? { |student| passing?(student) }
end

def passing?(student)
  student[:grades].sum / student[:grades].length >= 75
end

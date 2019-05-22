def all_words_capitalized?(arr)
  arr.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
  tlds = [".com", ".net", ".io", ".org"]
  urls.none? do |url|
    tlds.any? { |tld| url.end_with?(tld) }
  end
end

def any_passing_students?(arr)
  arr.any? { |student| passing?(student) }
end

def passing?(student)
  student[:grades].sum / student[:grades].length >= 75
end

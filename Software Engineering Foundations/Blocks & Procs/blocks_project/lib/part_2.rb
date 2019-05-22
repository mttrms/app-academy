def all_words_capitalized?(arr)
  arr.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
  tlds = [".com", ".net", ".io", ".org"]
  urls.none? do |url|
    tlds.any? { |tld| url.end_with?(tld) }
  end
end

def any_passing_students?(students)
  students.any? do |student|
    grades = student[:grades]
    grades.sum / grades.length * 1.0 >= 75  
  end
end

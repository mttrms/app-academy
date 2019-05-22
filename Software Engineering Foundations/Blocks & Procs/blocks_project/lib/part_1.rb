def select_even_nums(arr)
  arr.select(&:even?) # { |i| i.even? }
end

def reject_puppies(arr)
  arr.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |sub_array| sub_array.reduce(&:+) > 0 } # .sum exists as well
end

def aba_translate(str)
  str.split("").map do |char|
    "aeiou".include?(char) ? char + "b" + char : char
  end.join("")
end

def aba_array(arr)
  arr.map { |word| aba_translate(word) }
end

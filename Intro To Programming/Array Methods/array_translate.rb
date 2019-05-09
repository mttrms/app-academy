# Write a method array_translate that takes in an array whose elements alternate
# between words and numbers. The method should return a string where each word is
# repeated the number of times that immediately follows in the array.

def array_translate(arr)
  translated = []

  arr.each_with_index do |ele, idx|
    if idx % 2 === 0
      arr[idx + 1].times { translated << ele }
    end
  end

  return translated.join("")
end

# Alternate solution
# def array_translate(arr)
#   translated = ""

#   i = 0
#   while i < arr.length
#     word = arr[i]
#     num = arr[i + 1]
#     num.times { translated += word}

#     i +=2
#   end

#   return translated
# end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts


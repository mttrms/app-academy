# Nested Loops

(1..3).each do |num1|

  (1..5).each do |num2|
    puts num1.to_s + " " + num2.to_s
  end
end

arr = ["a", "b", "c", "d", "e"]

# iterate through all possible pairs w/ dupes
# arr.each do |ele1|
#   arr.each do |ele2|
#     puts ele1 + ele2
#   end
# end

# iterage through only unique pairs

arr.each_with_index do |ele1, idx1|
  arr.each_with_index do |ele2, idx2|
    if idx2 > idx1
      puts ele1 + ele2
      puts idx1.to_s + idx2.to_s
      puts "--"
    end
  end
end

puts "-----"

# 2 dimensional arrays

arr = [
  ["a","b","c"],
  ["d","e"],
  ["f", "g", "h"]
]

#  print arr

#  print arr[1][1]

arr.each do |subArr|
  print subArr
  puts
  subArr.each do |ele|
    puts ele
    puts
  end
end
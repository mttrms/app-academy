# Spaceship Operator <=>
# a < b # => false

# a can be equal or greater than b

# a <=> b will return -1, 0 or 1
# -1 if a is less than b
# 0 if a is equal to b
# 1 if a is greater than b

p 7 <=> 2     # => 1
p 7 <=> 7     # => 0
p 2 <=> 7     # => -1
p 10 <=> 2    # => 1
p -5 <=> 10   # => -1
p -3 <=> -9   # => 1

def compare(a, b)
  if (a <=> b) == 1
    p "a is greater than b"
  elsif (a <=> b) == 0
    p "a is equal to b"
  else
    p "a is less than b"
  end
end

def bubble_sort(arr, &prc)
  sorted = false
  while !sorted
    sorted = true

    (0...arr.length - 1).each do |i|
      if prc.call(arr[i], arr[i + 1]) == 1
        arr[i], arr[i+1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end

  arr
end

p bubble_sort([9,8,7,1,2]) { |a, b| a <=> b }
sorted =  bubble_sort(["a", "z", "f", "g", "j"]) do |a, b|
  alpha = ("a".."z").to_a
  alpha.index(a) <=> alpha.index(b)
end

p sorted
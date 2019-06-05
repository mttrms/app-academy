class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    selected = []

    self.my_each do |ele|
      selected << ele if prc.call(ele) == true
    end

    selected
  end

  def my_reject(&prc)
    rejected = []

    self.my_each do |ele|
      rejected << ele if prc.call(ele) == false
    end

    rejected
  end

  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele) == true
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      return false if prc.call(ele) == false
    end
    true
  end

  def my_flatten
    flattened = []

    self.my_each do |ele|
      if !ele.is_a?(Array)
        flattened << ele
      else
        flattened += ele.my_flatten
      end
    end

    flattened
  end

  def my_zip(*args)
    zipped = []

    self.length.times do |i|
      sub_zip = [self[i]]
      
      args.each do |array|
        sub_zip << array[i]
      end

      zipped << sub_zip
    end

    zipped
  end

  def my_rotate(num = 1)
    rotated = self.dup

    if num < 0
      num.abs.times do
        rotated.unshift(rotated.pop)
      end
    else
      num.times do
        rotated.push(rotated.shift)
      end
    end

    rotated
  end

  def my_join(separator = "")
    joined = ""

    (0...self.length).each do |i|
      if i != (self.length - 1)
        joined += self[i] + separator
      else
        joined += self[i]
      end
    end

    joined
  end

  def my_reverse
    rotated = []
    
    self.each do |ele|
      rotated.unshift(ele)
    end

    rotated
  end
end

puts "My Each"
# My Each
# calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p return_value  # => [1, 2, 3]

puts "My Select"
# My Select
# Now extend the Array class to include my_select that takes a block and
# returns a new array containing only elements that satisfy the block.
# Use your my_each method!

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

puts "My Reject"
# My Reject
# Write my_reject to take a block and return a new array excluding elements
# that satisfy the block.

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

puts "My Any / All"
# My Any / My All
# Write my_any? to return true if any elements of the array satisfy the block
# and my_all? to return true only if all elements satisfy the block.

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

puts "My Flatten"
# My Flatten
# my_flatten should return all elements of the array into a new,
# one-dimensional array. Hint: use recursion!

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

puts "My Zip"
# My Zip
# Write my_zip to take any number of arguments. It should return a new array
# containing self.length elements. Each element of the new array should be an
# array with a length of the input arguments + 1 and contain the merged elements
# at that index. If the size of any argument is less than self, nil is returned
# for that location.

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

puts "My Rotate"
# Write a method my_rotate that returns self rotated. By default, the array
# should rotate by one element. If a negative value is given, the array is rotated
# in the opposite direction.

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

puts "My Join"
# my_join returns a single string containing all the elements of the array,
# separated by the given string separator. If no separator is given, an empty
# string is used.

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

puts "My Reverse"
# Write a method that returns a new array containing all the elements of the
# original array in reverse order.

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

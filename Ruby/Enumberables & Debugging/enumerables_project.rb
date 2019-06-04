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
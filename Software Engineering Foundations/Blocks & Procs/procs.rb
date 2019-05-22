# Procs
# A proc is an object that contains a block.

# Creating a Proc
# We can't pass a block into a method, but we can turn the block into a proc
# and pass that proc into a method to be executed. Think of a proc as a wrapper
# around a block

doubler = Proc.new { |num| num * 2 }
p doubler # <Proc:0x00007f9a8b36b0c8> visual representation of the proc object

# We can't save a plain block to a variable:
# doubler = { |num| num * 2 }

# Calling a Proc
# To execute the code a proc contains, use the Proc#call method

doubler = Proc.new { |num| num * 2 }
p doubler.call(5)
p doubler.call(7)

# When calling the proc, we can pass in any arguments the block expects. The 
# Proc#call method will evaluate to the last line of code executed within the block

is_even = Proc.new do |num|
  if num % 2 == 0
    true
  else
    false
  end
end

p is_even.call(12)

# Passing a Proc to a Method

def add_and_proc(num1, num2, prc)
  sum = num1 + num2
  p prc.call(sum)
end

# Some procs to pass into `add_and_proc`
doubler = Proc.new { |num| num * 2 }
square = Proc.new { |num| num * num }
negate = Proc.new { |num| -1 * num}

add_and_proc(1, 100, doubler)
add_and_proc(3, 4, square) 
add_and_proc(6, 3, negate)

# We can automatically convert a block into a proc when passed into a method

def add_and_proc(num1, num2, &prc)
  sum = num1 + num2
  p prc.call(sum)
end

add_and_proc(1, 4) { |num| num ** 3 }

# By using the & operator on the third parameter, ruby knows to convert the
# block we pass into a proc

# Because of the &prc parameter, we must always pass a block into add_and_proc

# add_and_proc(1, 4, doubler) # => ArgumentError

def my_method(prc)
  # prc is expecting a proc
end

def my_other_method(&prc)
  # &prc is expecting a block. & denotes conversion from block to proc.
end

# Using &
# & can convert a block into a proc.. but it can also be used to convert a proc into a block.

def add_and_proc(num_1, num_2, &prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
# add_and_proc(1, 4, doubler)   # Error
add_and_proc(1, 4, &doubler)   # => 10
add_and_proc(1, 4) { |num| num * 2 } # => 10
# doubler is a proc
# &doubler is a block

# & Example with Array#map which must be given a block
[1,2,3].map { |num| num * 2 } # => [2, 4, 6]
[1,2,3].map(&doubler) # => [2, 4, 6]
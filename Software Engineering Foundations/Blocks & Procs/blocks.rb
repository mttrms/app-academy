# Blocks
# A block is a chunk of code that is passed into a method to be executed.

# Two ways to pass a block into a method

[1,2,3].map { |num| -(num * 2) }

[1,2,3].map do |num|
  doubled = num * 2
  -doubled
end

#  In other words, using return in a block will not make the block evaluate to the
# return value. The return will force the outer method to evaluate to the return
# value. This is a huge reason why we should treat blocks and methods as somewhat
# distinct concepts.

# Correct:
def double_eles(arr)
  arr.map do |ele|
    ele * 2
  end
end
double_eles([1,2,3]) #=> [2,4,6]

# Incorrect:
def double_eles(arr)
  arr.map do |ele|
    return ele * 2
  end
end
double_eles([1,2,3]) #=> 2

# Using methods as blocks

["a", "b", "c"].map { |str| str.upcase }
[1, 2, 5].select { |num| num.odd? }

# For blocks that follow the above pattern, Ruby allows cleaner syntax.

["a", "b", "c"].map(&:upcase)
[1, 2, 5].select(&:odd?)

# &:upcase
# :upcase is a symbol referring to the String#upcase method
# We can't pass a method into another method
# The & operator converts this method into an object we can pass into map

array.map { |block_param| block_param.method }
array.map(&:method)
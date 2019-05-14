# each
# map
# select

# all?
# Return true when all elements result in true when passed into the block
p [2, 4, 6].all? { |el| el.even? }  # => true
p [2, 3, 6].all? { |el| el.even? }  # => false

# any?
# Return true when at least one element results in true when passed into the block
p [3, 4, 7].any? { |el| el.even? }  # => true
p [3, 5, 7].any? { |el| el.even? }  # => false

# none?
# Return true when no elements result in true when passed into the block
p [1, 3, 5].none? { |el| el.even? } # => true
p [1, 4, 5].none? { |el| el.even? } # => false

# one?
# Return true when exactly one element results in true
p [1, 4, 5].one? { |el| el.even? }  # => true
p [1, 4, 6].one? { |el| el.even? }  # => false
p [1, 3, 5].one? { |el| el.even? }  # => false

# count
# Return a number representing the count of elements that result in true when passed into the block
p [1, 2, 3, 4, 5, 6].count { |el| el.even? }    # => 3
p [1, 3, 5].count { |el| el.even? }             # => 0

# sum
# Return the total sum of all elements
p [1, -3, 5].sum   # => 3

# max and min
# Return the max or min element
p [1, -3, 5].min    # => -3
p [1, -3, 5].max    # => 5
p [].max            # => nil

# flatten
# Return 1 Dimensional version of any array
multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]

p multi_d.flatten   # => ["a", "b", "c", "d", "e", "f"]

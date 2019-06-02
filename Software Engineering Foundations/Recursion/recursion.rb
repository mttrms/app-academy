# Recursion – when a method calls itself

# Simple, but broken recursive method

def say_hello
  p "hello"
  # say_hello # an infinite loop
end

say_hello # prints "hello" forever

def count_down(num)
  p num
  # count_down(num - 1)
end

# count_down(10)....count_down(0)....count_down(-forever)

count_down(10)

def count_down(num)
  # base case
  if num == 0
    p "Houston, we have lift off!"
    return # as soon as we hit a `return`, we exit immediately, breaking out of the loop
  end

  p num
  # recursive step, make progres towards the base case
  count_down(num - 1)
end

count_down(10)

# Anatomy of a recursive method – two fundamental parts
# Base Case – where we halt the recursion by not making a further call
# Recursive Step - where we continue the recursion by making another call
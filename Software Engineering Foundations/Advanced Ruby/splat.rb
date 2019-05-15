# Splat Operator

def greet(first_name, last_name, *other_args)
  p first_name
  p last_name
  p other_args
end

greet("matt", "ramos", "test", "apple", "cat")
puts

# Splat in arguments

def say_hi(first_name, last_name)
  p first_name
  p last_name
end

arr = ["aaa", "bbb"]
say_hi(*arr)

# More splat

dogs = ["spot", "pup", "woof"]
new_dogs = [ *dogs, "charlie" ]

p new_dogs

hash = {a: 1, b: 2}
new_hash = {**hash, c: 3, d: 4}

p new_hash
# While Loops

def repeatHello
  puts "before the loop"
  counter = 0
  while counter < 5
    puts "hello"
    counter += 1
  end
  puts "after the loop"
end

# repeatHello

def printNums
  i = 0
  while i <= 100
    puts i

    i += 1
  end
end

# printNums

def printSomeNums(min, max, step)
  i = min
  while i <= max
    puts i
    i += step
  end
end

printSomeNums(5, 35, 1)

# break – exit the loop
# next - skip to the next iteration

i = 1
while i <= 10
  puts i
  if i == 5
    i += 1
    next
  end
  puts i
  i += 1
end
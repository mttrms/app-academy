# Debugging

## Read the error.. Look for:
* Error type
* Error message
* Line number
* Chain of methods leading up to it (stack trace)

## Perform a mental stack trace
- Why did it happen?
- What are the values of key variables?
- What did each line evaluate to leading up to the bug?

- Break code down into testable chunks and run each chunk to test.
- Use `p` statements often
- Use the debugger

## Write code that's testable

```
# primes.rb

primes = []

num = 1
while primes.count < 100
  is_prime = true
  (1..num).each do |idx|
    if num % idx == 0
      is_prime = false
      break
    end
  end

  if is_prime
    primes << num
  end
end

puts primes
```

Can't isolate this code.. make it more testable:

```
# primes.rb

def prime?(num)
  (1..num).each do |idx|
    if num % idx == 0
      return false
    end
  end
end

def primes(num_primes)
  ps = []
  num = 1
  while ps.count < num_primes
    primes << num if prime?(num)
  end
end

if __FILE__ == $PROGRAM_NAME
  puts primes(100)
end
```

`if __FILE__ == $PROGRAM_NAME`. This checks to see if the currently running program ($PROGRAM_NAME) is the same as the current file (primes.rb). If so, then this is being invoked as a script, so we should kick things off. Otherwise, we're loading it as part of some other program (like irb or Pry), and we shouldn't do more than load the method definitions so that someone else may use them.

Now we can test `prime?` and `primes` individually.

### Pay technical debt
If you encounter buggy code that is poorly decomposed into methods, fix the design immediately

## Don't read the source

Yes, many silly bugs can be spotted if you stare at the code, but many other silly bugs are difficult to spot because our eyes play tricks on us.

**Use Pry to load the file and test individual methods**

**Use byebug for debugging**
* check value of our variables at any time
* watch value of a variable over time to see when it changes
* change a variable in the middle of program exectuion
* set breakpoints
* examine call stack

**Step through code:**

```
require 'byebug'

def prime?(num)
  debugger # drops us into the debugger right after this point

  (1..num).each do |idx|
    if num % idx == 0
      return false
    end
  end
end

def primes
  # ... etc.
```
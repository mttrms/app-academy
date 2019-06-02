# Factorial
# Write a method `factorial(n)` which takes a number and returns the factorial of n.
# A factorial is the product of all whole numbers between 1 and n, inclusive.
# For example, `factorial(5)` is 5 * 4 * 3 * 2 * 1 = 120.

# factorial(5) = 5 * 4 * 3 * 2 * 1
# factorial(4) = 4 * 3 * 2 * 1
# factorial(3) = 3 * 2 * 1
# factorial(2) = 2 * 1
# factorial(1) = 1 (base case)

# factorial(5) = 5 * factorial(4)
# ...
# factorial(2) = 2 * factorial(1)
# factorial(1) = 1 (base case)

def factorial(n)
  return 1 if n == 1
  n * factorial(n - 1)
end

p factorial(5)

# Solving a problem recursively
# 1. Identify the base case and code it. Arguments should be "trivially small". Be sure it works.
# 2. Solve the next level of the problem, using the result of the base case, test it.
# 3. Modify code in step 2, generalizing for every level of the problem.

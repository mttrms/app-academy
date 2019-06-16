# Intro to Recursion

- What is recursion?
- Base case & inductive step
- Recursion vs iteration
- Stack overflow
- The stack

## What is recursion?
A function that calls itself.

Factorial
6! = 6 * 5 * 4 * 3 * 2 * 1
5! = 5 * 4 * 3 * 2 * 1
...

Base case
1! = 1

Break down into pieces: the inductive step
n * factorial(n - 1)

Think about the problem in subproblems.

Strategies for Programming Recursively
--------------------------------------

It helps to have a general strategy with which to tackle recursive problems.

**Map out a recursive decomposition**: Think about how the problem breaks down recursively. That is, how will you reduce the problem size towards the base case. It's sometimes helpful to even sketch it out.

**Identify the base case(s)**: The base case will be the case when the stack stops growing - that is, when the chain of deferred operations will begin to evaluate. What will your method return in the most trivial of cases? Your recursive decomposition should always be moving towards that trivial case.

**Think one level up from the base case**: What will happen when you call your recursive method with a value that will require a single recursive call - that is, with a value one away from the base case. How will you have to manipulate that value in order to return the right thing? Ensure your manipulation generalizes.

**Ensure that your return values from any case (base case or otherwise) are always of the same type**. If you need an array as the final return value then the intermediate return values must also be arrays. Why? Because each of those intermediate values are returning from the same method!

**Get a stack trace**. Ruby won't normally print a stack trace for stack overflow errors, because this might print several thousand lines to the screen. If you're having a hard time debugging a stack overflow, you can paste the following code snippet at the top of your file. The snippet will intentionally crash your program before the stack overflow occurs, allowing you to read the stack trace.

```
MAX_STACK_SIZE = 200
tracer = proc do |event|
  if event == 'call' && caller_locations.length > MAX_STACK_SIZE
    fail "Probable Stack Overflow"
  end
end
set_trace_func(tracer)
```
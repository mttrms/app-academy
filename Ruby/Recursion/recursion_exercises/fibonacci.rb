def iterative_fibonacci(n)
  nums = []

  n.times do |i|
    if i == 0
      nums << i
    elsif i == 1 || i == 2
      nums << 1
    else
      nums << (nums[-1] + nums[-2])
    end
  end

  nums
end

p iterative_fibonacci(22)

def recurisve_fibonacci(n)
  return [0, 1] if n == 2
  return [0] if n == 1
  
  fib_seq = recurisve_fibonacci(n - 1)
  fib_seq << fib_seq[-2] + fib_seq[-1]
end

p recurisve_fibonacci(4)

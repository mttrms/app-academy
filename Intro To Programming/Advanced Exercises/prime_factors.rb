# Write a method prime_factors that takes in a number and returns an array
# containing all of the prime factors of the given number.

def prime_factors(num)
  factors = (2...num).select { |factor| num % factor == 0 }
  prime_factors = factors.select { |factor| prime?(factor)}
end

def prime?(num)
  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  
  return true
end

print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts
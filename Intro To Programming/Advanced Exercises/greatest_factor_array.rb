# Write a method greatest_factor_array that takes in an array of numbers and
# returns a new array where every even number is replaced with it's greatest
# factor. A greatest factor is the largest number that divides another with
# no remainder. For example the greatest factor of 16 is 8. (For the purpose of
# this problem we won't say the greatest factor of 16 is 16, because that would
# be too easy, ha)

def greatest_factor_array(arr)
  greatest_factors = arr.map do |num|
    if num % 2 == 0
      greatest_factor?(num)
    else
      num
    end
  end
end

def greatest_factor?(num)  
  (2...num).each do |factor| # could do .reverse_each and omit 'num / factor'
    if num % factor == 0
      return num / factor
    end
  end
end

print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
puts
print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
puts
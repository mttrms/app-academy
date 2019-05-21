# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
  # debugger
  divisors = (1..num).each.select {|i| num % i == 0 && is_prime?(i)}
  divisors.max
end

def is_prime?(num)
  return false if num < 2
  (2...num).each do |factor|
    return false if num % factor == 0
  end

  true
end

def unique_chars?(str)
  char_map = Hash.new(0)
  str.each_char { |char| char_map[char] += 1 }
  !(char_map.values.max > 1)
end

def dupe_indices(arr)
  # Count the chars
  index_map = char_map(arr)

  # Remove single use chars, add indices
  index_map.each { |k, v| v > 1 ? index_map[k] = get_indices(k, arr) : index_map.delete(k) }
  
  index_map
end

def get_indices(char, arr)
  arr.each_with_index.select{ |ele, idx| ele == char }.map{ |ele, idx| idx if ele == char }
end

def ana_array(arr1, arr2)
  char_map(arr1) == char_map(arr2)
end

def char_map(arr)
  map = Hash.new(0)
  arr.each { |ele| map[ele] += 1 } 
  map
end

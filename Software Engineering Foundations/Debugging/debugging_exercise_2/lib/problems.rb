# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  num.downto(2) do |factor|
    return factor if num % factor == 0 && is_prime?(factor)
  end
end

def is_prime?(num)
  return false if num < 2

  (2...num).none? { |i| num % i == 0 }
end

def unique_chars?(str)
  char_map = Hash.new(0)
  str.each_char { |char| char_map[char] += 1 }
  !(char_map.values.max > 1)
end

def dupe_indices(arr)
  indices = Hash.new { |hash, key| hash[key] = [] }
  arr.each_with_index { |ele, idx| indices[ele] << idx if arr.count(ele) > 1 }
  indices
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

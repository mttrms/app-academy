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
  chars = []
  str.each_char do |char|
    if chars.include?(char)
      return false
    end
    chars << char
  end

  true
end

def dupe_indices(arr)
  indices = Hash.new { |hash, key| hash[key] = [] }
  arr.each_with_index { |ele, idx| indices[ele] << idx if arr.count(ele) > 1 }
  indices
end

def ana_array(arr1, arr2)
  ele_map(arr1) == ele_map(arr2)
end

def ele_map(arr)
  map = Hash.new(0)
  arr.each { |ele| map[ele] += 1 } 
  map
end

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

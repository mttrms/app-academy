# Given a list of integers, find the smallest number in the list.
# my_min(list) # => -5

list = [0, 3, 5, 4, -5, 10, 1, 90]

# O(n^2)
def my_slow_min(list)
  list.each { |num| return num if list.all? { |ele| num <= ele } }
end

# O(n)
def my_min(list)
  smallest_num = list[0]
  list.each do |num|
    smallest_num = num if num < smallest_num
  end

  smallest_num
end

p my_min(list)

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence)
# sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# list = [5, 3, -7]
# largest_contiguous_subsum(list) # => 8

# O(n^2)
list = [5, 3, -7]
def largest_contiguous_subsum(list)
  subs = []

  list.each_with_index do |num, idx|
    list[idx..-1].each_with_index do |num2, idx2|
      subs << list[idx..idx+idx2]
    end
  end

  subs.reduce([0]) { |acc, arr| arr.sum > acc.sum ? arr : acc } 
end

p largest_contiguous_subsum(list)

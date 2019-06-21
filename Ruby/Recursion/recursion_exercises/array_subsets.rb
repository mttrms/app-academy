require "byebug"

def subsets(arr)
  # debugger
  # subs = []

  if arr.empty?
    return [[]]
  end

  subs = subsets(arr[0...-1])
  subs << [arr[-1]]

  new_subs = []

  subs.each do |element|
    if !element.include?(arr[-1])
      a = element.dup
      a << arr[-1]
      new_subs << a
    end
  end

  subs += new_subs

  subs.uniq
  
end

# Test Cases
p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

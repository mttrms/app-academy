def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets(arr[0...-1])

  subs.each do |element|
    if !element.include?(arr[-1])
      subs << element.dup.push(arr[-1])
    end
  end

  subs
end

# Test Cases
p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
  # debugger
  return [arr] if arr.length == 1
  perms = []

  arr.each_with_index do |ele, idx|
    other_eles = arr[0...idx] + arr[idx + 1..-1]
    other_ele_permutations = permutations(other_eles)

    other_ele_permutations.each do |sub_perm|
      perms << [ele] + sub_perm
    end
  end

  perms
end

def permutations_alt(arr)
  return [arr] if arr.length <= 1

  first = arr.shift
  perms = permutations(arr)
  total_permutations = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_permutations
end

# Test Case
p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2], 
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]
p permutations_alt([1, 2, 3])
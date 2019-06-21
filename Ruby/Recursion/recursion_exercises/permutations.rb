def permutations(arr)
  return [[]] if arr.empty?
  perms = permutations(arr[0...-1])

  perms.each do |perm|
    if !perm.include?(arr[-1])
      perms << perm.dup.push(arr[-1])
      perm.unshift(arr[-1])
      
    end
  end

  perms.select { |perm| perm.length == arr.length }.uniq
end

# Test Case
p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]

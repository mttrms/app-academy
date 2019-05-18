def partition(arr, limit)
  arr.reduce([ [], [] ]) do |acc, num|
    lower = acc[0]
    higher = acc[1]
    
    num < limit ? lower << num : higher << num

    [lower, higher]
  end
end

def merge(hash1, hash2)
  merged_hash = hash2.clone # makes a 'shallow' copy of hash2

  hash1.each do |k, v|
    merged_hash[k] = v if !merged_hash.has_key?(k)
  end

  merged_hash
end
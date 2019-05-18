def partition(arr, limit)
  arr.reduce([ [], [] ]) do |acc, num|
    lower = acc[0]
    higher = acc[1]
    
    num < limit ? lower << num : higher << num

    [lower, higher]
  end
end
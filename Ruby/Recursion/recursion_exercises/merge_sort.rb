def merge_sort(arr)
  return arr if arr.length == 1
  mid = (arr.length - 1) / 2
  left = merge_sort(arr[0..mid])
  right = merge_sort(arr[mid + 1..-1])

  merge(left, right)
end

def merge(l, r)
  merged = []

  while l.any? && r.any?
    if l[0] < r[0]
      merged << l.shift
    else
      merged << r.shift
    end
  end

  while l.any?
    merged << l.shift
  end

  while r.any?
    merged << r.shift
  end

  merged
end

# Test cases
p merge_sort([6, 5, 3, 1, 8, 7, 2, 4])
p merge_sort(["x", "z", "a", "c", "b", "v", "d", "k"])
p merge_sort([9,8,7,6,5,6,7,8,9,0,9,8,7,6,5,4,3,2,3,2,3,2,3,2])
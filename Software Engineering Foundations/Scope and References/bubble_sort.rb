# Bubble Sort
# Bubble sort works by performing multiple passes to move elements closer to
# their final positions. A single pass will iterate through the entire array once.

arr = [5, 7, 1, 3, 2, 9]

def bubble_sort(array)
  sorted = false
  while !sorted
    sorted = true
    
    (0...array.length - 1).each do |i| # end at 2nd to last element for comparison to last ele
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
  end

  array
end

print bubble_sort(arr)
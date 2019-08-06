# Given an array, and a window size w, find the maximum range (max - min) within a set of w elements.

def max_windowed_range(arr, window_size)
  current_max_range = nil

  (0..arr.length - window_size).each do |idx|
    window = arr[idx...idx + window_size]
    min = window.min
    max = window.max
    
    if current_max_range.nil? || (max - min) > current_max_range
      current_max_range = (max - min) 
    end
  end
  
  current_max_range
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2)
p max_windowed_range([1, 0, 2, 5, 4, 8], 3)
p max_windowed_range([1, 0, 2, 5, 4, 8], 4)
p max_windowed_range([1, 3, 2, 5, 4, 8], 5)

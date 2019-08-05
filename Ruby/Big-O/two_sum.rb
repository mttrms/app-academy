nums = [1, 9, 3, -5, 8, 4, 2, 6]
nums2 = Array.new(30000) { rand(1...80000) }
nums3 = [1,2,2,5]

def bad_two_sum?(arr, target)
  arr.each_with_index do |num1, idx1|
    arr.each_with_index do |num2, idx2|
      next if idx1 == idx2
      return true if num1 + num2 == target
    end
  end

  false
end

def okay_two_sum?(arr, target)
  arr.sort!
  left_idx = 0
  right_idx = arr.length - 1

  until left_idx == right_idx
    small_num = arr[left_idx]
    big_num = arr[right_idx]

    return true if small_num + big_num == target
    small_num + big_num < target ? left_idx += 1 : right_idx -= 1

    next
  end

  false
end

def two_sum?(arr, target)
  nums = Hash.new
  arr.each do |num|
    return true if nums[target - num]
    nums[num] = true
  end

  false
end


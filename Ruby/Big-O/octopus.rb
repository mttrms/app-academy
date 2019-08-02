# The Big O-ctopus exercises

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Find the longest fish in O(n^2) time.

biggest_fish = nil
fishes.each_with_index do |fish, idx|
  fishes.each_with_index do |fish2, idx2|
    fish.length > fish2.length ? biggest_fish = fishes[idx] : biggest_fish = fishes[idx2]
  end
end

p biggest_fish

# Find the longest fish in O(n log n) time.

def fish_sort(fish_arr)
  return fish_arr if fish_arr.length == 1

  mid = (fish_arr.length - 1 ) / 2
  left = fish_sort(fish_arr[0..mid])
  right = fish_sort(fish_arr[mid + 1..-1])

  fish_merge(left, right)
end

def fish_merge(left, right)
  merged = []

  while left.any? && right.any?
    left.first.length < right.first.length ? merged << left.shift : merged << right.shift
  end

  merged += left if left.any?
  merged += right if right.any?

  merged
end

p fish_sort(fishes)

# Find the longest fish in O(n) time.

def fish_finder(fish_arr)
  biggest_fish = nil 
  fish_arr.each do |fish|
    biggest_fish = fish if biggest_fish == nil || fish.length > biggest_fish.length
  end

  biggest_fish
end

p fish_finder(fishes)

# Dancing Octopus
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can
# assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# Find the direction the octopus must move in O(n) time
def slow_dance(move, arr)
  arr.each_with_index do |dir, idx|
    return idx if move == dir
  end
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

# Find the direction the octopus must move in O(1) time

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(move, hash)
  hash[move]
end

p fast_dance("up", tiles_hash)
p fast_dance("left", tiles_hash)


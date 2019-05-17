# Variable References Lecture

word_1 = "boot"
word_2 = "boot"

p word_1.object_id
p word_2.object_id

word_2 = word_1
p word_1.object_id
p word_2.object_id

puts

str = "hello"
p str.object_id

str = "bye"
p str.object_id

arr_1 = [1, 2]
arr_2 = arr_1
arr_1 << 3
p arr_2

grid = Array.new(3, Array.new(3)) # Subarray references same location in memory
p grid

grid [0][0] = "X"
p grid

better_grid = Array.new(3) { Array.new(3) } # Each block evaulation will get a new Array
p better_grid
better_grid[0][0] = "X"
p better_grid
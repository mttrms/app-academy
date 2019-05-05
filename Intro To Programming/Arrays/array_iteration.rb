food = ['pizza', 'sushi', 'burgers', 'tacos', 'ramen', 'steak']

# i = 0
# while i < food.length
#   puts food[i]
#   i += 1
# end

def print_array(arr)
  i = 0
  while i < arr.length
    puts arr[i]
    i += 1
  end
end

print_array(food)
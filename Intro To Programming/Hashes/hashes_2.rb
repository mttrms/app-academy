# Hashes
# default value nil
# Hash.new(default value)
# counter hash strategy

my_hash = {
    "a" => 28
}

puts my_hash["b"]

str = "hello world"

counter = Hash.new(0)

str.each_char { |char| counter[char] += 1}

# puts counter

new_hash = {"a" => 42, "b" => 10}
key = "b"
puts new_hash[key]

# counter hash
# sort_by

str = "mississippi river"
count = Hash.new(0)

str.each_char { |char| count[char] += 1}
puts count

print count
puts
sorted = count.sort_by { |k, v| v}

print sorted[-1][0]
# Data Structure - Hashes
# `key => value` pairs

my_hash = {
    "name" => "Matt",
    "color" => "blue",
    "age" => 100,
    "exists" => true,
    42 => "hi"
}

my_hash["color"] = "purple"
my_hash["age"] += 1
puts my_hash

# Hash Methods
# .length
# .has_key?(k)
# .has_value?(v)
# .keys – returns array
# .values – returns array

dog = {
    "name" => "Charlie",
    "color" => "White",
    "age" => 15,
    "isHungry" => true,
    "enemies" => ["squirrel"]
}

dog["location"] = "NJ"
dog["enemies"] << "mailman"
puts dog

puts dog.has_key?("namessss")
puts dog.has_value?("Charlie")

puts dog.keys

# Hash enumerables
# .each
# .each_key
# .each_value

pizza = {
    "style" => "New York",
    "slices" => 8,
    "diameter" => "15 inches",
    "toppings" => ["meatballs", "pepperoni"],
    "is_tasty" => true
}

puts pizza

# pizza.each do |k, v|
#     puts k
#     puts v
#     puts "---"
# end

pizza.each_key do |k|
    puts k
end

pizza.each_value do |v|
    puts v
end
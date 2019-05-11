# Write a method get_double_age that takes in a hash and returns twice the
# "age" value of the hash.

def get_double_age(hash)
    hash["age"] *= 2
end

puts get_double_age({"name"=>"App Academy", "age"=>5}) # => 10
puts get_double_age({"name"=>"Ruby", "age"=>23})       # => 46
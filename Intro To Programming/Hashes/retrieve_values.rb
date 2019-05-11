# Write a method retrieve_values that takes in two hashes and a key. The
# method should return an array containing the values from the two hashes that
# correspond with the given key.

def retrieve_values(hash1, hash2, key)
    [hash1[key], hash2[key]]
    # values = []
    # values << hash1[key]
    # values << hash2[key]
end

dog1 = {"name"=>"Fido", "color"=>"brown"}
dog2 = {"name"=>"Spot", "color"=> "white"}
print retrieve_values(dog1, dog2, "name") #=> ["Fido", "Spot"]
puts
print retrieve_values(dog1, dog2, "color") #=> ["brown", "white"]
puts
# Write a method select_upcase_keys that takes in a hash and returns a new hash
# containing key-value pairs of the original hash that had uppercase keys. You
# can assume that the keys will always be strings.

# def select_upcase_keys(hash)
#   upcase_hash = {}
#   hash.each_key do |key|
#     if key == key.upcase
#       upcase_hash[key] = hash[key]
#     end
#   end
#   return upcase_hash
# end

def select_upcase_keys(hash)
  selected = {}
  hash.each do |k, v|
    if k == k.upcase
      selected[k] = v
    end
  end

  return selected
end

print select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4}) # => {"MODEL"=>"S", "SEATS"=>4}
puts

print select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"}) # => {"DATE"=>"July 4th"}
puts
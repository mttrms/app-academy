# Write a method ae_count that takes in a string and returns a hash containing
# the number of a's and e's in the string. Assume the string contains only
# lowercase characters.

def ae_count(str)
    count = {
        "a" => 0,
        "e" => 0
    }
    
    str.each_char do |char|
        if "ae".include?(char)
            count[char] += 1
        end
    end
    count
end

puts ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
puts ae_count("keyboard") #=> {"a"=>1, "e"=>1}
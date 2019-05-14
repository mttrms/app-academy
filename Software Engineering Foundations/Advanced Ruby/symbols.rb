# Symbols
# Similar to strings, but immutable. Good unique identifiers, common to use
# symbols as hash keys. Set in hash { name: "matt" } or { :name => "matt"} and 
# reference with hash[:name]. Effecient for quick lookup.

sym = :hello
sym2 = :hello
str = "hello"
str2 = "hello"

p sym[1]
p str[1]

p sym.object_id
p sym2.object_id

p str.object_id
p str2.object_id

person = {
  :name => "matt",
  :age => "100"
}

person_2 = {
  name: "Matt",
  age: "101"
}

p person
p person[:name]

p person_2
p person_2[:name]
# Array Methods
# << adds one element to end of the array, returns the array
# arr.push adds an element(s) to end of the array, returns the array
# arr.pop removes the last element of an array, returns removed element
# arr.unshift adds element to front of the array, returns array
# arr.shift removes first element of the array, returns removed element
# arr.index
# arr.include?
# arr.reverse, returns new array, does not mutate original array
# arr.reverse!, mutates original array
# arr[startIdx..endIdx] grabs elements from start to end (inclusive)
# arr[startIdx...endIdx] grabs elements from start to end (excluding endIdx)
# str.split returns an array
# arr.join returns a string

names = ["alvin", "matt", "noah"]
names.push("thor")
names.unshift("spiderman")

print names
print names << "matt"
print names.push("matt")
print names.pop
print names.shift

arr = ["SF", "NY", "LA"]
puts arr.index("NY")
puts arr.include?("NJ")
puts arr.include?("NY")

p arr.reverse
print arr

print arr[0...1]

print arr[0..-1]

str = "we can turn a string into an array"
split =  str.split("a")
puts
print split
puts
puts split.join("i")
puts str

print str.split("")

print str.split("a").join("x")
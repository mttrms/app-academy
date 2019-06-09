# References & Memory

x = 4
# assigning x a reference that points to where "4 lives"

x = 5
# change the reference to where "5 lives"

x = 4
y = x
x = 10
p y

# y = 4, y points to whatever x _was_ pointing to.
# numbers are immutable

x = "Donatello"
y  = x
x << " the TMNT"
p y # the TMNT

x = "Donatello"
y = x
x += " the TMNT"
p y # Not the TMNT

x = Array.new(3, [])
x[0] << "Hello"

# all subarrays are "Hello". All subarrays are referencing the same object.

x = Array.new(3) { [] } # Block is executed every element
x[0] = "Hello"
p x # [Hello], [], []
# Methods

def sayMessage
  puts "hello from the method"
end

puts "before"
sayMessage
puts "after"

def sayHey(person1, person2)
  puts "Hey " + person1 + " and " + person2
end

sayHey("Matt", "Matt2")

def calc_average(num1, num2)
  avg = (num1 + num2) / 2.0
  return avg
end

puts calc_average(5,10)
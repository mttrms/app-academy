# Classes

cat_1 = {name: "Apollo", color: "black", age: 7}
cat_2 = {name: "Tiger", color: "gray", age: 19}
cat_3 = {name: "Claws", color: "black", age: 16}

# Creating a Cat Class
class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end
end

# Use the class keyword to create a class
# Name of class must being with a capital letter
# Can define methods within a class

# initialize is a special method that we'll use when creating cats
# @name, @color, @age -- @ denotes an instance variable or attribute for our class

# Initializing new cats
cat_1 = Cat.new("Apollo", "black", 7)
cat_2 = Cat.new("Tiger", "gray", 19)

p cat_1
p cat_2

# When we call `Cat.new` ruby will call on the initialize method
# Cat.new will return an object that we can store in a variable

# Getter Methods
# We want a way to refer to the value of Cat attributes
# So we define Getter methods to return those attributes

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def get_name
    @name
  end
end

cat_1 = Cat.new("Apollo", "black", 7)
# p cat_1.get_name

# By convention, getter methods typically have the same name as the attribute
# they are returning. Instead of get_name, we'll define name.

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def name
    @name
  end

  def age
    @age
  end
end

cat_1 = Cat.new("Apollo", "black", 7)
p cat_1.name
p cat_1.age

# cat_1.age = 42  # NoMethodError: undefined method `age='
# Getter methods cannot modify the @attribute. But..

# Setter Methods

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  # getter
  def age
    @age
  end

  # setter
  def age=(number)
    @age = number
  end
end

cat_1 = Cat.new("Apollo", "black", 7)
cat_1.age = 8
p cat_1

# these are equivalent
# cat_1.age=(42)
# cat_1.age = 42

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def purr
    if @age > 5
      puts @name + " purr..."
    else
      puts "....."
    end
  end
end

cat_1 = Cat.new("Matt", "Black", 8)
cat_1.purr
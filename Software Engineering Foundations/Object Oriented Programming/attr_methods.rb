# Attribute Methods
# So far, we've had to manually implement getter and setter methods for our
# attributes.

class Dog
  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end

  # getters
  def name
    @name
  end

  def age
    @age
  end

  # setters
  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end
end

# attr_reader
# A new method, #attr_reader will create getters automatically 
# attr_reader should be passed symbols that correspond to names of attributes we want getters for

class Dog
  # attr_reader will define #name and #age getters for us
  attr_reader :name, :age

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end

dog = Dog.new("Fido", 3, "pizza")
dog.name
dog.age
dog.favorite_food # NoMethodError: undefined method `favorite_food', because we didn't pass it to attr_reader

# When we call attr_reader...
class MyClass
  attr_reader :attribute_1
  # ...
end

# It results in this under the hood:
class MyClass
  # ...
  def attribute_1
    @attribute_1
  end
end

# attr_writer
# We can use attr_writer to define setter methods
class Dog
  # attr_writer will define #name= and #age= setters for us
  attr_writer :name, :age

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end

dog = Dog.new("Fido", 3, "pizza")

dog.name = "Spot"
dog.age += 1

p dog #<Dog:0x007fd87f1144a0 @age=4, @favorite_food="pizza", @name="Spot">

dog.favorite_food = "calzone" # NoMethodError: undefined method `favorite_food=', because we did't pass it to attr_writer

# When we call attr_writer...
class MyClass
  attr_writer :attribute_1
  # ...
end

# It does this:
class MyClass
  # ...
  def attribute_1=(new_val)
    @attribute_1 = new_val
  end
end

# attr_accessor – When we want both a getter and a setter for an attribnute. It
# is a combination of both attr_reader and attr_writer.
class Dog
  # attr_accessor will define #name, #name=, #age, #age= methods for us
  attr_accessor :name, :age

  def initialize(name, age, favorite_food)
    @name = name
    @age = age
    @favorite_food = favorite_food
  end
end

dog = Dog.new("Fido", 3, "pizza")

# Let's use the setter and getter for name!
dog.name = "Spot"
p dog.name          # "Spot"

# Don't pass all class attributes to attr_accessor. Make sure an attribute needs
# to be manipulated, and is safe to do so.

# Instance methods vs Class methods

# Instance methods
# A method called on an instance of a class

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def speak
    @name + " says " + @bark
  end
end

my_dog = Dog.new("fido", "woof")
p my_dog.speak

other_dog = Dog.new("Doge", "much bork")
p other_dog.speak

# speak is an instance method becuase we can only call it on a Dog instance we
# initialized using Dog.new. Dog#speak because speak is an instance method of Dog

# Class Methods
# A class method is a method called directly on the class.

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def self.growl
    "Grr"
  end
end

p Dog.growl

# We define a class method by adding `self.` to the front of a method name.
# In this contet, `self` refers to the `Dog` class itself. Since `growl` is 
# a class method, we cannot call it on an instance. A class method cannot 
# refer to instance variables like @name or @bark.

# We'll build class methods for added utility. For notation we'll use
# Dog::growl to denote growl is a class method of Dog

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end
  
  def self.whos_louder(dog_1, dog_2)
    if dog_1.bark.length > dog_2.bark.length
      return dog_1.name
    elsif dog_1.bark.length < dog_2.bark.length
      return dog_2.name
    else
      return nil
    end
  end

  def name
    @name
  end

  def bark
    @bark
  end
end

d1 = Dog.new("Fido", "woof")
d2 = Dog.new("Doge", "much bork")

p Dog.whos_louder(d1, d2)

# The code inside whos_louder does not pertain to a single instance of dog, meaning
# it does not refer to instance attributes of @name or @bark


# Wrapping Up
# Class#method_name means method_name is an instance method
# Class::method_name means method_name is a class method

# Instance vs Class variables

# Instance variables
# Denoted with an @ and typically assigned within initialize

class Car
  def initialize(color)
    @color = color
  end

  def color
    @color
  end
end

# What if we wanted to have a property shared by all cars?
# Class variable

class Car
  @@num_wheels = 4

  def initialize(color)
    @color = color
  end

  def color
    @color
  end

  def num_wheels
    @@num_wheels
  end
end

car_1 = Car.new("black")
# p car_1.num_wheels

# @@ to denote class variables, and assigned outside of #initialize
# all Cars will share @@num_wheels

class Car
  @@num_wheels = 4

  def self.upgrade_to_flying_cars
    @@num_wheels = 0
  end

  def initialize(color)
    @color = color
  end

  def num_wheels
    @@num_wheels
  end
end

car_1 = Car.new("silver")
car_2 = Car.new("red")

p car_1.num_wheels # => 4
p car_2.num_wheels # => 4

Car.upgrade_to_flying_cars
p car_1.num_wheels # => 0
p car_2.num_wheels # => 0

# car_3 would have 0 wheels. Changing class variables effects every current
# or future instance

# Class Constants
# Prevent a class variable from being changed

class Car
  NUM_WHEELS = 4

  def self.upgrade_to_flying_cars
    NUM_WHEELS = 0 # SyntaxError: dynamic constant assignment
  end

  def initialize(color)
    @color = color
  end

  def num_wheels
    NUM_WHEELS
  end
end

# Wrap up
# An @instance_variable will be a distinct variable in each instance of a class
# changing it will only effect that one instance

# A @@class_variable will be shared among all instances. Changing it will effect
# all instances of the class

# a CLASS_CONSTANT will be shared among all instances of class but cannot
# be changed
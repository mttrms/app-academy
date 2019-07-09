# Modules
# Like a class, except you don't instantiate a module. Contain methods that can
# be mixed in to a Ruby class. Use a module to collect methods that can be mixed
# in and shared by many classes to avoid repeating code.

module Greetable
  def greet
    "Hello, my name is #{self.name}"
  end
end

class Human
  include Greetable
  
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end
end

class Robot
  include Greetable
  
  def name
    "Robot Model #2000"
  end
end

# Can also use Class#extend method to mix in module methods as class methods.

module Findable
  def objects
    @objects ||= {}
  end

  def find(id)
    objects[id]
  end

  def track(id, object)
    objects[id] = object
  end
end

class Cat
  extend Findable
  
  def initialize(name)
    @name = name
    Cat.track(@name, self)
  end
end

Cat.new("Gizmo")
Cat.find("Gizmo") # finds Gizmo Cat object

# Mixins vs Multiple Inheritance
# Ruby doesn't support multiple inheritance. A class can only have one parent
# class. Ruby's answer to multiple inheritance is the ability to mix in modules.
# If two classes share methods, but shouldn't share a base class, put the common
# methods in a module and include in both classes. Example: Enumerable
module Enumerable
  def map(&prc)
    results = []

    # notice how we need `each` to write `map`
    self.each { |el| results << prc.call(el) }

    results
  end

  ...
end

class Array < Object
  include Enumerable
  ...
end

class Hash < Object
  include Enumerable
  ...
end

# Namespaces prevent name collisions. `make_bacon` in a.rb & b.rb.. but a file
# `requires` both files, one `make_bacon` will overwrite the other. If each file
# is wrapped in a module, there is no difficulty.

module A
  def self.make_bacon
    ...
  end
end

module B
  def self.make_bacon
    ...
  end
end

require "A"
require "B"

a_grade_bacon = A.make_bacon
b_grade_bacon = B.make_bacon
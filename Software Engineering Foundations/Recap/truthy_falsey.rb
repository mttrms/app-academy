# Truthy and Falsey values
# Every value in Ruby can be treated as true or false
# `nil` and `false` are the only falsey values, everything else is truthy

# a || b
# when `a` is truthy, return `a`
# when `a` is falsey, return `b`

p true || 42          # => true
p 42 || true          # => 42
p false || 42         # => 42
p 42 || false         # => 42
p false || "hello"    # => "hello"
p nil || "hello"      # => "hello"
p "hi" || "hello"     # => "hi"
p 0 || true           # => 0
p false || nil        # => nil

def greet(person = nil)
  person = person || "you"
  p "Hey #{person}"
end

greet("Matt")
greet

def greet(person = nil)
  person ||= "you"
  p "Hey #{person}"
end

greet("Matt")
greet

# Default Procs
def call_that_proc(val, &prc)
  prc ||= Proc.new { |data| data.upcase + "!!" }
  prc.call(val)
end

p call_that_proc("hi")
p call_that_proc("hi") { |data| data * 3 }
p call_that_proc("hi") { |data| "-----" + data.upcase + "-----" }

# `prc` will automatically contain `nil` if the method is called without passing in a proc

# Lazy Initialization - `||=` is helpful when implementing lazy initialization for classes
# Design strategy where we delay creation of an object until it is needed. To 
# avoid slow or costly operations.

# Initialize all attributes immediately
class Restaurant
  attr_accessor :name, :chefs, :menu

  def initialize(name, chefs)
      @name = name
      @chefs = chefs
      @menu = ["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
  end
end

five_star_restaurant = Restaurant.new("Appetizer Academy", ["Marta", "Jon", "Soon-Mi"])
p five_star_restaurant

# It isn't necessary to assign `@menu` immediately. We should only create it if needed.
class Restaurant
  attr_accessor :name, :chefs, :menu

  def initialize(name, chefs)
    @name = name
    @chefs = chefs
  end

  def menu
    @menu ||= ["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
  end
end

five_star_restaurant = Restaurant.new("Appetizer Academy", ["Marta", "Jon", "Soon-Mi"])
p five_star_restaurant # no menu yet!
p five_star_restaurant.menu # menu is created
p five_star_restaurant # menu remains

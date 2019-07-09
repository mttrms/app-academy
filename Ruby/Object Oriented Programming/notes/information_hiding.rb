# Private Methods
# We can mark specific methods in classes *private*. When we do so, the only 
# way to access those methods is from within the class itself.

class Airplane
  def fly
    start_engine
    ...
  end

  private
  def start_engine
    ...
  end
end

a = Airplane.new
a.fly # this will call start_engine
a.start_engine # this will throw a private_method error

# The point of object orientation is to present a simple interface, abstracting
# away the details inside the method implementations.

# A good guiding principle of OO design is: minimize the interfaces between your
# classes; expose the least possible amount of state and behavior, and have a
# good reason for every piece of information that you expose.
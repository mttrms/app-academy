# Privacy

# keywords:
public
private
protected

class Cat
  public
  def meow
    puts "meow"
  end

  # access control gets set until another access control statement is
  # seen.
  def other_public_method
  end

  private
  def thoughts
    ...
  end

  protected
  def clean
    ...
  end
end

# Public methods can be called by anyone - no access control. Methods are public
# by default (except initialize, which is always private)

# Private methods can't be called with an explicit receiver. You can't specify
# an object when using them, so they can only be used in the defining class.

class MyClass
  private
  def private_thing
     puts "Hello World"
  end

  public
  def explicit_receiver
     self.private_thing
  end

  def implicit_receiver
     private_thing
  end
end

privacy = MyClass.new
privacy.implicit_receiver # => Hello World
privacy.explicit_receiver # => NoMethodError (self.private_method is not allowed)

# Note: Private methods are inherited as private. Subclasses will have access to them.

# Protected methods can be invoked only by pobjects of the defining class and
# its subclasses.

class Dog
  def initialize
    # dominance score is not explicitly observable
    @secret_dominance_score = rand
  end

  def dominates?(other_dog)
    self.secret_dominance_score > other_dog.secret_dominance_score
  end

  protected
  attr_reader :secret_dominance_score
end

# Only Dog class and Dog subclasses can view :secret_dominance_score

# Access controls are not about security.

class Cat
  private
  def meow
    puts "meow"
  end
end

cat = Cat.new
cat.send(:meow) # => "meow"

# Access control to describe to other programmers reading your code:
# - What methods are the interface they'll want to use? What to ignore?
# - What are "supported" and public, and which can potentially change? Private methods
#   because they are normally focused on internal details are removed/changed as code
#   grows.

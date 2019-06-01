# Syntactic Sugar - code or syntac that is a shortcut for other code.
# attr_reader is sntactic sugar for defining a full getter method

# Operator methods

# Implementing == and > 
class Person
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def ==(other_person)
    self.last_name == other_person.last_name
  end

  def >(other_person)
    self.age > other_person.age
  end
end

person_1 = Person.new("Jane", "Doe", 20)
person_2 = Person.new("John", "Doe", 18)
person_3 = Person.new("John", "Wayne", 18)

# Calling Person#== without any syntactic sugar is awkward:
p person_1.==(person_2)     # true

# With syntactic sugar, it's much more elegant:
p person_1 == person_2      # true
p person_2 == person_3      # false

p person_1 > person_2


# Implementing #
class Queue
  def initialize
    @line = []
  end

  def [](position)
    @line[position]
  end

  def add(ele)
    @line << ele
    nil
  end

  def remove
    @line.shift
  end
end

grocery_checkout = Queue.new
grocery_checkout.add("Alan")
grocery_checkout.add("Alonzo")

# Calling Queue#[] without any syntactic sugar is ugly:
grocery_checkout.[](0)          # "Alan"
grocery_checkout.[](1)          # "Alonzo"

# With syntactic sugar, it's waaaaay better:
grocery_checkout[0]             # "Alan"
grocery_checkout[1]             # "Alonzo"

# grocery_checkout.[](1) is equivalent to grocery_checkout[1]

# Implementing #[]=
class Queue
  def initialize
    @line = []
  end

  def [](position)
    @line[position]
  end

  def []=(position, ele)
    @line[position] = ele
  end

  def add(ele)
    @line << ele
    nil
  end

  def remove
    @line.shift
  end
end

grocery_checkout = Queue.new
grocery_checkout.add("Alan")
grocery_checkout.add("Alonzo")

# Let's call Queue#[]= without syntactic sugar:
grocery_checkout.[]=(0, "Grace")
p grocery_checkout    #<Queue:0x007fe7a7a29ec8 @line=["Grace", "Alonzo"]>

# Let's call Queue#[]= again, but with syntactic sugar:
grocery_checkout[1] = "Grace"
p grocery_checkout    #<Queue:0x007fe7a7a29ec8 @line=["Grace", "Grace"]>

# grocery_checkout.[]=(0, "Grace") is equivalent to grocery_checkout[0] = "Grace"
class Minnow
  def eat
    puts "eat eat eat"
  end
end

class Shark
  def eat
    puts "eat eat eat"
  end
end

# DRY tells us we should remove this duplicated code, if possible. Create a 
# superclass.
class Fish
  def eat
    puts "eat eat eat"
  end
end

class Minnow < Fish
end

class Shark < Fish
end

# We can write generic code that processes subclasses
class Employee
  def wage
    20_000
  end
end

class Manager < Employee
  def wage
    50_000
  end
end

class CEO < Manager
  def wage
    1_000_000
  end
end

# calculate the total salary of many employees
def total_salary(employees)
  total = 0
  employees.each do |employee|
    # Don't know/care what kind of `Employee` (regular, Manager,
    # or CEO) this is. We can treat them all the same.
    total += employee.wage
  end
end

# Don't introduce subclasses before you need them.
# Guideline (don't introduce a new subclass until):
# 2 different subclasses of the same base class, AND
# The 2 subclasses are very different behaviors.

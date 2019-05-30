# OOP – Design pattern used when building applications
# Goal of OOP is to create programs using objects that interact with each other

# 2 pillars of OOP: Abstraction & Encapsulation

# Abstraction – The process of exposing essential features of an object while
# hiding inner details that aren't necesssary to using the feature.

# Classes should have methods that are simple to use because because they hide
# complex logic inside of them

# Class that does not abstract how to enroll a student into a course:
class Course
  def initialize(name, teachers, max_students)
    @name = name
    @teachers = teachers
    @max_students = max_students
    @students = []
  end

  def max_students
    @max_students
  end

  def students
    @students
  end
end  

course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)

# Let's enroll a student
if course.students.length < course.max_students
  course.students << "Alice"
end

# An abstracted #enroll method:
class Course
  def initialize(name, teachers, max_students)
    @name = name
    @teachers = teachers
    @max_students = max_students
    @students = []
  end

  def enroll(student)
    @students << student if @students.length < @max_students
  end
end  

course = Course.new("Object Oriented Programming 101", ["Ada Lovelace", "Brian Kernighan"], 3)

# Let's enroll a student
course.enroll("Alice")

# Encapsulation – Closely relates methods and data attributes together with the
# hope of preventing misuse. Give users access to things that are safe for them to use.

# The rules of a Queue are simple: if you're the first in, then you're first out
class Queue
  def initialize
    @line = []
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
    @line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new

# In the above class, there is no getter for @line. If we give a user acecss to
# @line then we can't enforce our rules. See below:
class Queue
  def initialize
    @line = []
  end

  def line
    @line
  end

  def add(ele)
    @line << ele # add ele to back of line
    nil
  end

  def remove
    @line.shift  # remove front ele of line
  end
end

grocery_checkout = Queue.new

grocery_checkout.add("bob")
grocery_checkout.add("alice")
grocery_checkout.line.unshift("noam")   # noam cut the line!
grocery_checkout.remove                 # => "noam"
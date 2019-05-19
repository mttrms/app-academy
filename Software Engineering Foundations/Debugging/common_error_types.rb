# Common Error Types

# SyntaxError
# A SyntaxError results from incorrectly structuring our code. In proper
# English we must follow certain grammar rules. In the same way proper Ruby must
# follow particular syntax rules. Because we can violate the "grammar" of Ruby
# in many different ways, there is no hard and fast rule to spot a SyntaxError
my_variable = # SyntaxError because we need to have a value to assign


# NameError
# A NameError results from referring to a variable or method name that has
# not been defined:
my_variable = 42
p my_variabel # NameError because this name has not been defined previously


# NoMethodError
# A NoMethodError results from referring to an undefined method. It is
# considered a special instance of a NameError:
def say_hello(name)
  p "hi " + name
end

hello("world")  # NoMethodError because `hello` is not a defined method


# ArgumentError
# A ArgumentError results from incorrectly specifying arguments for a method
# call. Typically this means passing too little or too many arguments:

def say_hello(first_name, last_name)
  p "hi " + first_name + " " + last_name
end
  
say_hello("world")  # ArgumentError because we gave 1 arg, but `say_hello` expects 2 args  


# TypeError
# A TypeError results from performing an operation with incompatible data types

5 + "spaghetti" # TypeError because we cannot add a Integer and a String together
# Scope

def say_hello
  message = "hello"
end

# p message // message not defined in this scope

message = "hi"

def say_hi
  p message # message not defined in this scope, inaccessible
end

# say_hi // will fail

# Global Variables

$message = "hello globe"

def say_global
  p $message
end

say_global

# Constants
# Name begins with capital, all caps by convention, cannot be reassigned
# Constants exist in global scope. FOOD is available in 'favorites' method

FOOD = "pho"
$drink = "birch beer"
p FOOD

# FOOD = "ramen" // cannot be reassigned

FOOD[0] = "P" # but data can still be mutated
p FOOD

def favorites
  p FOOD
  p $drink
end

# Blocks, conditionals, while loops do not have their own scope. They are part
# of the containing scope.
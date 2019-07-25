class Sloth
  attr_reader :name, :foods, :drinks
  DIRECTIONS = %w(north south east west)

  def initialize(name)
    @name = name
    @foods = []
    @drinks = {}
  end
  
  def eat(food)
    @foods << food
  end

  def drink(beverage, amount)
   @drinks[beverage] = amount 
  end

  def run(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    "I'm running #{direction} at .0001 miles per hour!"
  end
end

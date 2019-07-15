require_relative 'employee'

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    @employees.reduce(0) { |acc, el| acc + el.salary } * multiplier
  end 
end
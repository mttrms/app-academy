require_relative 'employee'

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier) 
    sub_salaries * multiplier
  end

  def sub_salaries
    salaries = 0
    @employees.each do |employee|
      salaries += employee.salary
      salaries += employee.sub_salaries if employee.class == Manager
    end

    salaries
  end
end
require_relative 'Manager'
require_relative 'Employee'

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.employees << darren
darren.employees.push(shawna, david)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
require_relative 'Manager'
require_relative 'Employee'

m = Manager.new("Matt", "SEO", 100)
e = Employee.new("Test", "SEO", 100)
e2 = Employee.new("test2", "SEO", 5000)

p m
m.employees << e
m.employees << e2
p m.employees
p m.bonus(2)
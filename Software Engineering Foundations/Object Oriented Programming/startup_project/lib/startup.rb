require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title) ? true : false
  end

  def >(startup)
    @funding > startup.funding ? true : false
  end

  def hire(name, title)
    raise "Invalid title." if !@salaries.has_key?(title)
    @employees << Employee.new(name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]

    if @funding < salary
      raise "Uh oh, we're broke."
    else
      @funding -= salary
      employee.pay(salary)
    end
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    salaries = []
    @employees.each { |employee| salaries << @salaries[employee.title] }

    salaries.sum / salaries.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding

    startup.salaries.each do |title, salary|
      @salaries[title] = salary if !@salaries.has_key?(title)
    end

    @employees.concat(startup.employees)
    startup.close
  end

end

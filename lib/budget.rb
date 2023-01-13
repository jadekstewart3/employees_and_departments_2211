class Budget
  attr_reader :year,
              :total_budget,
              :departments
        
  def initialize(budget_info)
    @year = budget_info[:year].to_i
    @total_budget = budget_info[:total_budget][1..-1].to_i
    @departments = []
  end

  def add_department(department)
    @departments.push(department)
  end
  
  def expenses_less_than_500
    departments = @departments.map do |department|
      department if department.expenses < 500
    end
    departments.compact
  end

  def employee_salaries
   salaries = Hash.new
   @departments.each do |department|
    department.employees.each do |employee|
        if salaries[employee]
          salaries[employee] = employee.salary
        else 
          salaries[employee] = employee.salary  
        end
      end
    end
    salaries
  end

  def employee_expenses
    employee_expenses = Hash.new 

    @departments.each do |department|
      department.employees.each do |employee|
        if  employee_expenses[employee]
          employee_expenses[employee] << employee.expenses
        else
          employee_expenses[employee] = [employee.expenses].flatten
        end
      end
    end
    employee_expenses
  end

  def total_employee_expenses
    total_employee_expenses = Hash.new(0)

    employee_expenses.each do |employee, expenses|
      expenses.each do |expense|
        total_employee_expenses[employee] += expense
      end
    end
    total_employee_expenses
  end
end
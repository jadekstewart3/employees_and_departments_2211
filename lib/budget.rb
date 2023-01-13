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
end
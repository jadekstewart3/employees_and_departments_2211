class Employee
  attr_reader :name,
              :age,
              :salary,
              :expenses

  def initialize(empolyee_info)
    @name = empolyee_info[:name]
    @age = empolyee_info[:age].to_i
    @salary = empolyee_info[:salary][1..-1].to_i
    @expenses = []
  end

  def give_raise(amount)
   @salary += amount
  end

  def add_expense(amount)
    @expenses.push(amount)
  end
end
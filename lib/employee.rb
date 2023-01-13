class Employee
  attr_reader :name,
              :age,
              :salary

  def initialize(empolyee_info)
    @name = empolyee_info[:name]
    @age = empolyee_info[:age].to_i
    @salary = empolyee_info[:salary][1..-1].to_i
  end
end
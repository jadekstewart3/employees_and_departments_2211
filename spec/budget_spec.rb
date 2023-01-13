require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe do 
  let(:budget) { Budget.new({year: "2023", total_budget: "$100000000"})}

  let(:customer_service) { Department.new("Customer Service") }
  let(:it) { Department.new("I.T.") }

  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
  let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"}) }
  let(:philip) { Employee.new({name: "Philip James", age: "36", salary: "$101000"}) }
  let(:zach) { Employee.new({name: "Zach Hazelwood", age: "32", salary: "$100500"}) }

  describe '#initialize' do 
    it 'exists' do 
      expect(budget).to be_a(Budget)
    end

    it 'has attributes' do 
      expect(budget.year).to eq(2023)
      expect(budget.total_budget).to eq(100000000)
    end
  end

  describe '#add_department' do 
    it 'adds departments to the departments array' do
      budget.add_department(customer_service)
      budget.add_department(it)

      expect(budget.departments).to eq([customer_service, it])
    end
  end

  describe '#expenses_less_than_500' do 
    it 'returns a has with expenses less and 500 by department' do 
      budget.add_department(customer_service)
      budget.add_department(it)

      customer_service.expense(100)
      customer_service.expense(25)

      it.expense(550)       
      it.expense(75) 
      
      
      expect(budget.expenses_less_than_500).to eq([customer_service])
    end
  end

  describe '#employee_salaries' do
    it 'returns a hash of employees and their salaries' do 
      budget.add_department(customer_service)
      budget.add_department(it)

      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      it.hire(philip)
      it.hire(zach)

      expected = {
                  bobbi => 100000,
                  aaron => 90000,
                  philip => 101000,
                  zach => 100500
                }
      expect(budget.employee_salaries).to eq(expected)
    end
  end

  describe '#employee_expenses' do 
    it 'returns a hash of employees (key) and their expenses(value)' do 
      budget.add_department(customer_service)
      budget.add_department(it)

      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      it.hire(philip)
      it.hire(zach)

      bobbi.add_expense(100)
      bobbi.add_expense(25)
      aaron.add_expense(50)
      philip.add_expense(300)
      philip.add_expense(75)
      zach.add_expense(45)
      zach.add_expense(90)

      expected = {
                  bobbi => [100, 25],
                  aaron => [50],
                  philip => [300, 75],
                  zach => [45, 90]
      }

      expect(budget.employee_expenses).to eq(expected)
    end
  end
end
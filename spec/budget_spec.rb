require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe do 
  let(:budget) { Budget.new({year: "2023", total_budget: "$100000000"})}

  let(:customer_service) { Department.new("Customer Service") }
  let(:it) { Department.new("I.T.") }

  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
  let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) }

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
end
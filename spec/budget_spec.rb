require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe do 
  let(:customer_service_budget) { Budget.new({year: "2023" total_budget: "$400000"})}

  let(:customer_service) { Department.new("Customer Service") }

  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
  let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) }

  describe '#initialize' do 
    it 'exists' do 
      expect(customer_service_budget).to be_a(Budget)
    end

    it 'has attributes' do 
      expect(customer_service_budget.year).to eq(2023)
      expect(customer_service_budget.total_budget).to eq(400000)
    end
  end
end
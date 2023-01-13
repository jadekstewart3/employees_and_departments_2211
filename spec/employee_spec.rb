require './lib/employee'

RSpec.describe do 

  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }

  describe '#initialize' do 
    it 'exists' do 
      expect(bobbi).to be_a(Employee)
    end

    it 'has attributes' do 
      expect(bobbi.name).to eq("Bobbi Jaeger")
      expect(bobbi.age).to eq(30)
      expect(bobbi.salary).to eq(100000)
    end
  end
end
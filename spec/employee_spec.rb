require './lib/employee'

RSpec.describe do 

  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$10000"}) }

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

  describe '#give_raise' do 
    it 'increases and employees salary' do 
      bobbi.give_raise(5000)

      expect(bobbi.salary).to eq(105000)
    end
  end
end
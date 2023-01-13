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

  describe '#give_raise' do 
    it 'increases and employees salary' do 
      bobbi.give_raise(5000)

      expect(bobbi.salary).to eq(105000)
    end
  end

  describe '#add_expense' do
    it 'can generate an expense an add it to the expenses array' do 
      expect(bobbi.expenses).to eq([])

      bobbi.add_expense(100)
      bobbi.add_expense(25)

      expect(bobbi.expenses).to eq([100, 25])
    end
  end
end
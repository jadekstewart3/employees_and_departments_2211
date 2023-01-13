class Budget
  attr_reader :year,
              :total_budget
        
  def initialize(budget_info)
    @year = budget_info[:year].to_i
    @total_budget = budget_info[:total_budget][1..-1].to_i
  end
end
class Project < ActiveRecord::Base
  belongs_to :client ## => @project.client ## has embedded validation
  has_many :costs ## => @project.costs

  def total_cost
    @total_cost ||= self.costs.sum(:amount) if self.costs.length > 0
  end

  def profit
    if @total_cost == nil
      "N/A, Add your costs to this project"
    else
      self.price_to_client - @total_cost
    end
  end
end

class Project < ActiveRecord::Base
  belongs_to :client ## => @project.client ## has embedded validation
  has_many :costs ## => @project.costs

  def total_cost
    self.costs each do |amount|
  end

  def profit
    self.price_to_client - self.total_cost
  end
end

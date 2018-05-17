class Project < ActiveRecord::Base
  belongs_to :client ## => @project.client

  def profit
    self.price_to_client - self.cost_to_produce
  end
end

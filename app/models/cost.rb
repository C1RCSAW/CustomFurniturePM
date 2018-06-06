class Cost <ActiveRecord::Base
  belongs_to :project ## => @project.costs

  validates :amount, :description, presence: true
  
end

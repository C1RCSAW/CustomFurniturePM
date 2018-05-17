class Client < ActiveRecord::Base
  belongs_to :user ## => @client.user
  has_many :projects ## => @client.projects
end

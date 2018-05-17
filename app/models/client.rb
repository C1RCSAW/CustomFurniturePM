class Client < ActiveRecord::Base
  belongs_to :maker ## => @client.maker
  has_many :projects ## => @client.projects
end

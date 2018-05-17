class Client < ActiveRecord::Base
  belongs_to :user ## => @client.maker
  has_many :projects ## => @client.projects
end

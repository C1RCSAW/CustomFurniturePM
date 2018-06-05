class Client < ActiveRecord::Base
  belongs_to :user ## => @client.user
  has_many :projects ## => @client.projects

  validates :name, presence: true

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: 'must be in the form of an email' }

end

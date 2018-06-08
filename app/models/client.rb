class Client < ActiveRecord::Base
  belongs_to :user ## => @client.user
  has_many :projects ## => @client.projects

  validates :name, :email, presence: true
  validates_uniqueness_of :name, :email

  validates :name, format: { with: /\A[a-zA-Z\s]+\z/i,
                             message: 'name can only have letters'}

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              message: 'must be in the form of an email address' }

  validates :phone_number, format: { with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/,
                                     message: 'invalid entry for client phone number' }, allow_blank: true #phone number is optional

end

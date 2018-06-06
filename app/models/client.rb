class Client < ActiveRecord::Base
  belongs_to :user ## => @client.user
  has_many :projects ## => @client.projects

  validates :name, presence: true

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone_number, format: { with: /\(?([0-9]{3})\)?([ .-]?)(\1)\2([0-9]{4})/ }

  #access errors through errors.messages

    # (?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})

end

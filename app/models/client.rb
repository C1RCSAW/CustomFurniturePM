class Client < ActiveRecord::Base
  belongs_to :user ## => @client.user
  has_many :projects ## => @client.projects

  validates :name, presence: true
  validates_uniqueness_of :name

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validates :phone_number, format: { with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/ }, allow_blank: true

  #access errors through errors.messages

    # (?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})

end

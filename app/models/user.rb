class User < ActiveRecord::Base
  has_many :clients ## => @user.clients
  has_many :projects, through: :clients ## => @user.client.projects
  has_secure_password

  validates :name, :username, :email, presence: true
  validates_uniqueness_of :name, :username, :email

  validates :name, format: { with: /\A[a-zA-Z\s]+\z/i,
                             message: 'name can only have letters'}

  validates :username, format: { with: /\A[a-zA-Z0-9]+\z/i,
                                 message: 'usernames only allows letters and numbrs' }

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              message: 'must be in the form of an email address' }


  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find { |user| user.slug == slug}
  end

end

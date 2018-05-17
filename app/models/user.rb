class User < ActiveRecord::Base
  has_many :clients ## => @user.clients
  has_many :projects, through: :clients ## ? => @maker.client.projects ?
  # has_secure_password

  # validates :name, :username, :email, presence: true
  # validates_uniqueness_of :username

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find { |user| user.slug == slug}
  end

end

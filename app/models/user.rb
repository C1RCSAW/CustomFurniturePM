class User < ActiveRecord::Base
  has_many :clients ## => @maker.clients
  has_many :projects, through: :clients ## ? => @maker.client.projects ?
  has_secure_password

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Maker.all.find { |user| user.slug == slug}
  end

end

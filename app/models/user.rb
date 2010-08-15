class User < ActiveRecord::Base
  acts_as_authentic
  has_many :tabs
  has_many :drawers
  has_many :purchases
  
  attr_accessible :username, :role, :password, :password_confirmation
  
  def role?(role)
    self.role == role.to_s
  end
end
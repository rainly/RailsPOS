class Tab < ActiveRecord::Base
  belongs_to :drawer
  has_many :purchases
  has_many :transactions
  attr_accessible :name, :user_id, :closed_at, :type_helper, :drawer_id
  
  def type_helper   
    self.type 
  end 
  def type_helper=(type)   
    self.type = type
  end
end

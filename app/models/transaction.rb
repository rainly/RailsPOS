class Transaction < ActiveRecord::Base
  belongs_to :tab
  belongs_to :user
  attr_accessible :type_helper, :amount, :user_id, :tab_id
  
  def type_helper   
    self.type 
  end 
  def type_helper=(type)   
    self.type = type
  end  
end

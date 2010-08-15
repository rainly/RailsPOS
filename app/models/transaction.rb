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
  
  %w(amount).each do |meth|
    define_method(meth) do
      self[meth.to_sym].to_f / 100
    end

    define_method("#{meth}=") do |amount|
      self[meth.to_sym] = amount.to_f * 100
    end
  end
  
end

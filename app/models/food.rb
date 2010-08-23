class Food < ActiveRecord::Base
  versioned
  has_many :purchases, :as => :purchasable
  has_many :tabs, :through => :purchasable 
  attr_accessible :display_name, :cost, :sales_tax, :price, :display, :info
  
  validates_uniqueness_of :display_name
  validates_presence_of :display_name, :cost, :sales_tax, :price
  
  def revenue
    self.price.to_f / (1 + (self.sales_tax / 100))
  end
  
  def tax
    self.price - self.revenue
  end
  
  def profit
    self.revenue - self.cost
  end
  
  def margin
    self.profit / self.revenue * 100
  end
  
end

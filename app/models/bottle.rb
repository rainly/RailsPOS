class Bottle < ActiveRecord::Base
  versioned
  
  has_many :purchases, :as => :purchasable
  has_many :tabs, :through => :purchasable 
  
  attr_accessible :style, :display_name, :full_name, :brewery, :country, :abv, :source, :volume, :volume_unit, :cost, :glass_type, :sales_tax, :price, :stock, :display, :info

  validates_uniqueness_of :display_name
  validates_presence_of :display_name, :full_name, :brewery, :country, :abv, :style, :source, :volume, :volume_unit, :cost, :glass_type, :sales_tax, :price, :stock
  
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

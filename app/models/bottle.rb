class Bottle < ActiveRecord::Base
  versioned
  
  has_many :purchases, :as => :purchasable
  has_many :tabs, :through => :purchasable 
  
  attr_accessible :style, :display_name, :full_name, :brewery, :country, :abv, :source, :volume, :volume_unit, :cost, :glass_type, :sales_tax, :price, :stock, :display

  validates_uniqueness_of :display_name
  validates_presence_of :full_name, :brewery, :country, :abv, :style, :source, :volume, :volume_unit, :cost, :glass_type, :sales_tax, :price, :stock
  
  def revenue
    self.price.to_f / (1 + self.sales_tax)
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
  
  %w(price cost).each do |meth|
    define_method(meth) do
      self[meth.to_sym].to_f / 100
    end

    define_method("#{meth}=") do |amount|
      self[meth.to_sym] = amount.to_f * 100
    end
  end
end

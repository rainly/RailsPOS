class Draught < ActiveRecord::Base
  versioned
  has_many :purchases, :as => :purchasable
  has_many :tabs, :through => :purchasable 
  attr_accessible :display_name, :full_name, :brewery, :cost, :country, :abv, :style, :source, :volume, :volume_unit, :small, :cost,
                  :keg_cost, :serving_size, :glass_type, :sales_tax, :price, :stock, :display, :info, :small_serving_size, :small_price, :small_glass_type
  
  validates_uniqueness_of :display_name
  validates_presence_of :display_name, :full_name, :brewery, :country, :abv, :style, :source, :volume, :volume_unit,
                        :keg_cost, :serving_size, :glass_type, :sales_tax, :price, :stock
  
  def cost
    return 100
  end
  def small_cost
    return 100
  end
end

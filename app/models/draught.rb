class Draught < ActiveRecord::Base
  versioned
  has_many :purchases, :as => :purchasable
  has_many :tabs, :through => :purchasable 
  attr_accessible :display_name, :full_name, :brewery, :cost, :country, :abv, :style, :source, :volume, :volume_unit, :keg_cost, :serving_size, :glass_type, :sales_tax, :price, :stock, :display
  
  validates_uniqueness_of :display_name
  validates_presence_of :display_name, :full_name, :brewery, :country, :abv, :style, :source, :volume, :volume_unit, :keg_cost, :serving_size, :glass_type, :sales_tax, :price, :stock


  def cost
    return 100
  end

  %w(price keg_cost).each do |meth|
    define_method(meth) do
      self[meth.to_sym].to_f / 100
    end

    define_method("#{meth}=") do |amount|
      self[meth.to_sym] = amount.to_f * 100
    end
  end

end

class Food < ActiveRecord::Base
  versioned
  has_many :purchases, :as => :purchasable
  has_many :tabs, :through => :purchasable 
  attr_accessible :display_name, :cost, :sales_tax, :price, :display
  
  validates_uniqueness_of :display_name
  validates_presence_of :display_name, :cost, :sales_tax, :price
  
  %w(price cost).each do |meth|
    define_method(meth) do
      self[meth.to_sym].to_f / 100
    end

    define_method("#{meth}=") do |amount|
      self[meth.to_sym] = amount.to_f * 100
    end
  end
end

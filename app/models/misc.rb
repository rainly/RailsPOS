class Misc < ActiveRecord::Base
  versioned
  has_many :purchases, :as => :purchasable
  has_many :tabs, :through => :purchasable 
  attr_accessible :display_name, :cost, :sales_tax, :price, :display, :info
  
  validates_uniqueness_of :display_name
  validates_presence_of :display_name, :cost, :sales_tax, :price, :display
end

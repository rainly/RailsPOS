class Purchase < ActiveRecord::Base
  belongs_to :tab
  belongs_to :user
  belongs_to :purchasable, :polymorphic => true
  
  attr_accessible :tab_id, :user_id, :purchasable_id, :purchasable_type, :alteration_user_id, :alteration, :price, :version
  
  %w(price).each do |meth|
    define_method(meth) do
      self[meth.to_sym].to_f / 100
    end

    define_method("#{meth}=") do |amount|
      self[meth.to_sym] = amount.to_f * 100
    end
  end
  
end

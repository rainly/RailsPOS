class Purchase < ActiveRecord::Base
  belongs_to :tab
  belongs_to :user
  belongs_to :purchasable, :polymorphic => true
  
  attr_accessible :tab_id, :user_id, :purchasable_id, :purchasable_type, :alteration_user_id, :alteration, :price, :version
  
  def update_price (params)
    alteration = params[:alteration]
    self.alteration = alteration
    if alteration.blank? || alteration == "Normal"
      self.price = self.purchasable.price
    elsif alteration == "Misring" || alteration == "Spoil" || alteration == "100%"
      self.price = 0
    elsif alteration == "50%"
      self.price = self.purchasable.price * 0.5
    end
  end

end
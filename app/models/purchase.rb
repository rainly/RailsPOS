class Purchase < ActiveRecord::Base
  belongs_to :tab
  belongs_to :user
  belongs_to :purchasable, :polymorphic => true
  attr_accessible :tab_id, :user_id, :purchasable_id, :purchasable_type
end

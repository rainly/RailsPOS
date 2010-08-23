class Drawer < ActiveRecord::Base
  has_many :tabs
  belongs_to :user
  attr_accessible :user_id, :closed_at
  validates_presence_of :user_id
end

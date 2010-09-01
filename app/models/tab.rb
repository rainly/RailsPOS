class Tab < ActiveRecord::Base
  belongs_to :drawer
  belongs_to :user
  has_many :purchases
  has_many :transactions
  
  attr_accessible :name, :user_id, :closed_at, :type_helper, :drawer_id
  
  validates_presence_of :user_id, :type_helper, :drawer_id
  
  OPTIONS = [
    'Reorder',
    'Misring',
    'Spoil',
    'Normal',
    '50%',
    '100%',
    'Tab',
    'Kitchen'
  ]
  
  DEFAULT_OPTION = 'Normal'
  
  def total_sale
    @total = 0
    purchases.each do |purchase|
      @total += purchase.price
    end
    @total
  end
  
  def empty?
    if (self.purchases.count == 0) && (self.transactions.count == 0)
      return 1
    else
      return 0
    end
  end
  
  def open?
    if self.closed_at.blank?
      return 1
    else
      return 0
    end
  end
  
  def type_helper   
    self.type 
  end
  
  def type_helper=(type)   
    self.type = type
  end
end

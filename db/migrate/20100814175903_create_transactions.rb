class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :type
      t.integer :amount
      t.references :user
      t.references :tab
      t.timestamps
    end
  end
  
  def self.down
    drop_table :transactions
  end
end
